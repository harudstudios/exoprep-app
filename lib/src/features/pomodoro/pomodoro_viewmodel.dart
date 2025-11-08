// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/repositories/productivity_project_repository.dart';

class PomodoroViewModel {
  final ProductivityProjectRepository _productivityProjectRepository;

  PomodoroViewModel({
    ProductivityProjectRepository? productivityRepository,
  }) : _productivityProjectRepository =
           productivityRepository ?? ProductivityProjectRepository();

  final ValueNotifier<ViewModelState<dynamic>> productivityState =
      ValueNotifier(ViewModelState.idle());
  bool _isInitialized = false;

  void init() {
    // Prevent re-initialization
    if (_isInitialized) {
      AppLogs.debug('ProductivityViewModel already initialized');
      return;
    }

    _isInitialized = true;
    AppLogs.debug('ProductivityViewModel initialized');
  }

  void reset() {
    _isInitialized = false;

    AppLogs.debug('ProductivityViewModel reset');
  }

  void dispose() {
    productivityState.dispose();
  }
}
