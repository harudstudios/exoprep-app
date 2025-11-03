// lib/src/features/productivity/productivity_viewmodel.dart

import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/logger/logger.dart';
import 'package:root/src/models/project_model/project_model.dart';
import 'package:root/src/repositories/productivity_project_repository.dart';

class ProductivityViewModel {
  final ProductivityProjectRepository _productivityProjectRepository;

  ProductivityViewModel({
    ProductivityProjectRepository? productivityRepository,
  }) : _productivityProjectRepository =
           productivityRepository ?? ProductivityProjectRepository();

  final ValueNotifier<ViewModelState<dynamic>> productivityState =
      ValueNotifier(ViewModelState.idle());

  final ValueNotifier<DateTime> selectedDate = ValueNotifier(DateTime.now());
  final ValueNotifier<List<DateTime>> datesList = ValueNotifier([]);

  final ScrollController dateScrollController = ScrollController();
  bool isLoadingMoreDates = false;
  bool _isInitialized = false;

  void init() {
    // Prevent re-initialization
    if (_isInitialized) {
      AppLogs.debug('ProductivityViewModel already initialized');
      return;
    }

    _isInitialized = true;
    _initializeDatesList();
    AppLogs.debug('ProductivityViewModel initialized');
  }

  void _initializeDatesList() {
    final now = DateTime.now();
    final dates = <DateTime>[];

    for (var i = 29; i >= 0; i--) {
      dates.add(
        DateTime(
          now.year,
          now.month,
          now.day - i,
        ),
      );
    }

    datesList.value = dates;
    AppLogs.debug('Generated ${dates.length} dates for picker');
  }

  Stream<List<ProjectModel>> watchProjectsForSelectedDate() {
    return _productivityProjectRepository.watchProjectsForDate(
      selectedDate.value,
    );
  }

  // ⭐ Watch projects for specific date
  Stream<List<ProjectModel>> watchProjectsForDate(DateTime date) {
    return _productivityProjectRepository.watchProjectsForDate(date);
  }

  // ⭐ Watch all projects (today at 12:01 AM onwards)
  Stream<List<ProjectModel>> watchAllProjects() {
    return _productivityProjectRepository.watchProjects();
  }

  // ⭐ Update selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    AppLogs.debug('Selected date: ${date.day}/${date.month}/${date.year}');
  }

  // ⭐ Load more dates (for infinite scroll)
  void loadMoreDates() {
    if (isLoadingMoreDates) return;

    isLoadingMoreDates = true;
    final currentDates = datesList.value;
    final oldestDate = currentDates.first;
    final newDates = <DateTime>[];

    // Add 30 more dates before the oldest date
    for (var i = 1; i <= 30; i++) {
      newDates.add(
        DateTime(
          oldestDate.year,
          oldestDate.month,
          oldestDate.day - i,
        ),
      );
    }

    datesList.value = [...newDates.reversed, ...currentDates];
    isLoadingMoreDates = false;
    AppLogs.debug('Loaded more dates. Total: ${datesList.value.length}');
  }

  // Reset method for testing or logout scenarios
  void reset() {
    selectedDate.value = DateTime.now();
    datesList.value = [];
    _isInitialized = false;
    isLoadingMoreDates = false;
    AppLogs.debug('ProductivityViewModel reset');
  }

  void dispose() {
    productivityState.dispose();
    selectedDate.dispose();
    datesList.dispose();
    dateScrollController.dispose();
  }
}
