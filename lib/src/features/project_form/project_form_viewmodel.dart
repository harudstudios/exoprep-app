import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/repositories/productivity_project_repository.dart';

class ProjectViewModel {
  final ProductivityProjectRepository _projectProductivityRepository;

  ProjectViewModel({
    ProductivityProjectRepository? projectProductivityRepository,
  }) : _projectProductivityRepository =
           projectProductivityRepository ?? ProductivityProjectRepository();

  final ValueNotifier<ViewModelState<String>> projectFormState = ValueNotifier(
    ViewModelState.idle(data: ''),
  );

  void dispose() {
    projectFormState.dispose();
  }
}
