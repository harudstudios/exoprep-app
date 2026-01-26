import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/models/exam_model/exam_model.dart';
import 'package:root/src/repositories/home_repository.dart';

class HomeViewmodel {
  final HomeRepository _homeRepository = HomeRepository();
  final ValueNotifier<ViewModelState> homeViewState = ValueNotifier(ViewModelState.idle());

  final ValueNotifier<List<Exam>> popularExams = ValueNotifier([]);

  Future<void> _fetchLeafExams() async {
    try {
      final result = await _homeRepository.getLeafExams();
      popularExams.value = result;
      AppLogs.info('All Leaf Exams fetched: ${result.length}');
    } catch (e) {
      AppLogs.warning("Error in fetching All Leaf Exams : $e");
      popularExams.value = [];
    }
  }
}
