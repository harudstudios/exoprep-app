import 'dart:developer';
import 'package:root/src/models/project_model/project_model.dart';
import 'package:root/data/local/services/project_local_service.dart';
import 'package:root/data/models/project_model/project_schema_model.dart';

class ProductivityService {
  static final ProjectLocalService _projectLocalService = ProjectLocalService();

  Future<void> saveProjectFromViewModel(ProjectSchemaModel schemaModel) async {
    try {
      await _projectLocalService.initialize();
      await _projectLocalService.createProject(schemaModel);
      log('✅ Project saved successfully');
    } catch (e) {
      log('❌ Error saving project: $e');
      rethrow;
    }
  }

  Stream<List<ProjectModel>> watchProjectsStream({DateTime? date}) async* {
    await _projectLocalService.initialize();
    await for (final schemaList in _projectLocalService.watchProjectsCreatedAfter(date: date)) {
      final projectModels = schemaList.map(_convertToProjectModel).toList();
      yield projectModels;
    }
  }

  Stream<List<ProjectModel>> watchProjectsForDate(DateTime date) async* {
    await _projectLocalService.initialize();
    await for (final schemaList in _projectLocalService.watchProjectsForDate(date)) {
      final projectModels = schemaList.map(_convertToProjectModel).toList();
      yield projectModels;
    }
  }

  ProjectModel _convertToProjectModel(ProjectSchemaModel schema) {
    return ProjectModel(
      id: schema.id,
      projectName: schema.projectName,
      hasTimeGoal: schema.hasTimeGoal,
      timeGoalDurationMinutes: schema.timeGoalDurationMinutes,
      timeGoalFrequency: schema.timeGoalFrequency,
      timeGoalRepeatingFrequency: schema.timeGoalRepeatingFrequency,
      timeGoalOneTimeStartDate: schema.timeGoalOneTimeStartDate,
      timeGoalOneTimeHasDeadlineDate: schema.timeGoalOneTimeHasDeadlineDate,
      timeGoalOneTimeDeadlineDate: schema.timeGoalOneTimeDeadlineDate,
      tagColor: schema.tagColor,
    );
  }
}
