import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:root/src/models/exam_model/exam_model.dart';
import 'package:root/src/models/leaderboard_model/leaderboard_model.dart';
import 'package:root/src/services/leaderboard_service.dart';
import 'package:root/src/core/exceptions/network_exception.dart';

class LeaderboardRepository {
  final LeaderboardService _leaderboardService;

  LeaderboardRepository({LeaderboardService? leaderboardService})
    : _leaderboardService = leaderboardService ?? LeaderboardService();

  Future<List<Exam>> getLeafExams({String? query}) async {
    try {
      final response = await _leaderboardService.getLeafExams();
      log('Response: $response');
      final examJson = (response.data?['exams'] as List<dynamic>?) ?? [];
      return examJson.map((json) => Exam.fromJson(json as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  Future<({List<LeaderboardModel> leaderboard, LeaderboardUser userRank})> getStreaksLeaderboardByExam(String examID) async {
    try {
      final response = await _leaderboardService.getStreakLeaderboardByExam(examID: examID);
      log('Response: $response');
      return (
        leaderboard: LeaderboardModel.fromList(response.data?['leaderboard'] as List<dynamic>?),
        userRank: LeaderboardUser.fromJson(response.data?['user_entry']),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  Future<({List<LeaderboardModel> leaderboard, LeaderboardUser userRank})> getScoreLeaderboardByExam(String examID) async {
    try {
      final response = await _leaderboardService.getScoreLeaderboardByExam(examID: examID);
      log('Response: $response');
      return (
        leaderboard: LeaderboardModel.fromList(response.data?['leaderboard'] as List<dynamic>?),
        userRank: LeaderboardUser.fromJson(response.data?['user_entry']),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
