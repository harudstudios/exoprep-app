import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:root/src/models/exam_model/exam_model.dart';
import 'package:root/src/models/leaderboard_model/leaderboard_model.dart';
import 'package:root/src/repositories/leaderboard_repository.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit() : super(LeaderboardInitial()) {
    getInitialData();
  }

  final LeaderboardRepository _leaderboardRepository = LeaderboardRepository();
  List<Exam> allExams = [];

  List<LeaderboardModel> scoreLeaderboard = [];
  List<LeaderboardModel> streaksLeaderboard = [];

  LeaderboardUser? userScoreRank;
  LeaderboardUser? userStreaksRank;

  ValueNotifier<Exam?> selectedExam = ValueNotifier(null);

  Future<void> getInitialData() async {
    emit(LeaderboardLoadingState());
    try {
      await getAllLeafExams();
      if (allExams.isNotEmpty) {
        selectedExam.value = allExams.first;
        await getLeaderboardData(allExams.first.id);
      }
    } catch (e) {
      emit(ErrorState(err: e.toString()));
    }
  }

  Future<void> getLeaderboardData(String examID, {bool? showLoading}) async {
    if (showLoading ?? false) emit(LeaderboardLoadingState());
    try {
      await Future.wait([getScoreData(examID), getStreaksData(examID)]);

      emit(LeaderboardDataSuccessState());
    } catch (e) {
      emit(LeaderboardDataErrorState(err: e.toString()));
    }
  }

  Future<void> getAllLeafExams() async {
    allExams = await _leaderboardRepository.getLeafExams();
  }

  Future<void> getStreaksData(String examID) async {
    final data = await _leaderboardRepository.getStreaksLeaderboardByExam(examID);
    streaksLeaderboard = data.leaderboard;
    userStreaksRank = data.userRank;
  }

  Future<void> getScoreData(String examID) async {
    final data = await _leaderboardRepository.getScoreLeaderboardByExam(examID);
    scoreLeaderboard = data.leaderboard;
    userScoreRank = data.userRank;
  }

  Future<void> showLoadingDelay({Duration? durtion}) async {
    emit(LeaderboardLoadingState());
    await Future.delayed(durtion ?? Duration(seconds: 1));
    emit(LeaderboardDataSuccessState());
  }
}
