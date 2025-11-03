import 'dart:developer';

import 'package:root/data/models/project_model/project_schema_model.dart';
import 'package:root/src/models/project_model/project_model.dart';
import 'package:root/src/services/productivity_service.dart';

class ProductivityProjectRepository {
  final ProductivityService _productivityService;

  ProductivityProjectRepository({
    ProductivityService? productivityProjectService,
  }) : _productivityService =
           productivityProjectService ?? ProductivityService();

  Future saveProjectFromViewModel(ProjectModel projectModel) async {
    try {
      final schemaModel = ProjectSchemaModel(
        projectName: projectModel.projectName ?? '',
        hasTimeGoal: projectModel.hasTimeGoal,
        timeGoalDurationMinutes: projectModel.timeGoalDurationMinutes,
        timeGoalFrequency: projectModel.timeGoalFrequency,
        timeGoalRepeatingFrequency: projectModel.timeGoalRepeatingFrequency,
        timeGoalOneTimeStartDate: projectModel.timeGoalOneTimeStartDate,
        timeGoalOneTimeHasDeadlineDate:
            projectModel.timeGoalOneTimeHasDeadlineDate,
        timeGoalOneTimeDeadlineDate: projectModel.timeGoalOneTimeDeadlineDate,
        tagColor: projectModel.tagColor,
      );

      await _productivityService.saveProjectFromViewModel(schemaModel);
    } catch (e) {
      log('❌ Error saving project: $e');
    }
  }

  // ⭐ Stream projects created after today's 12:01 AM or specific date
  Stream<List<ProjectModel>> watchProjects({DateTime? date}) {
    return _productivityService.watchProjectsStream(date: date);
  }

  // ⭐ Stream projects for specific date
  Stream<List<ProjectModel>> watchProjectsForDate(DateTime date) {
    return _productivityService.watchProjectsForDate(date);
  }
}
