// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/constants/enums.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/repositories/productivity_project_repository.dart';

class PomodoroViewModel {
  factory PomodoroViewModel({
    ProductivityProjectRepository? repository,
  }) {
    if (!_instance._isInitialized && repository != null) {
      _instance._productivityProjectRepository = repository;
    }
    return _instance;
  }

  PomodoroViewModel._internal({
    ProductivityProjectRepository? productivityRepository,
  }) : _productivityProjectRepository =
           productivityRepository ?? ProductivityProjectRepository();

  static final PomodoroViewModel _instance = PomodoroViewModel._internal();

  late ProductivityProjectRepository _productivityProjectRepository;

  final ValueNotifier<ViewModelState<dynamic>> productivityState =
      ValueNotifier(ViewModelState.idle());

  final ValueNotifier<int> totalTimerValue = ValueNotifier<int>(0);
  final ValueNotifier<int> sessionTimerValue = ValueNotifier<int>(0);
  final ValueNotifier<int> sessionCount = ValueNotifier<int>(0);
  final ValueNotifier<int> pomodoroSessionLength = ValueNotifier<int>(0);
  final ValueNotifier<int> shortBreakTime = ValueNotifier<int>(0);
  final ValueNotifier<int> longBreakTime = ValueNotifier<int>(0);
  final ValueNotifier<int> sessionsTillLongBreak = ValueNotifier<int>(0);

  // **** stopped, playing, paused **** //
  final ValueNotifier<TimerStatus> paused = ValueNotifier<TimerStatus>(
    TimerStatus.stopped,
  );

  bool _isInitialized = false;

  void init() {
    if (_isInitialized) {
      AppLogs.debug('PomodoroViewModel already initialized');
      return;
    }

    _isInitialized = true;
    AppLogs.debug('PomodoroViewModel initialized');
  }

  void reset() {
    _isInitialized = false;
    AppLogs.debug('PomodoroViewModel reset');
  }

  void dispose() {
    productivityState.dispose();
  }
}
