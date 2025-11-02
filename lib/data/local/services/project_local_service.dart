import 'package:isar_community/isar.dart';
import 'package:root/data/local/database/isar_database.dart';
import 'package:root/data/models/project_model/project_model.dart';
import 'package:root/src/core/constants/enums.dart';

class ProjectLocalService {
  late final Isar _isar;

  // Initialize service
  Future<void> initialize() async {
    _isar = await IsarDatabase.getInstance();
  }

  // CREATE - Add new project
  Future<int> createProject(ProjectModel project) async {
    return await _isar.writeTxn(() async {
      project.createdAt = DateTime.now();
      project.updatedAt = DateTime.now();
      return await _isar.projectModels.put(project);
    });
  }

  // READ - Get project by ID
  Future<ProjectModel?> getProjectById(int id) async {
    return await _isar.projectModels.get(id);
  }

  // READ - Get all projects
  Future<List<ProjectModel>> getAllProjects() async {
    return await _isar.projectModels.where().findAll();
  }

  // READ - Get projects sorted by name
  Future<List<ProjectModel>> getProjectsSortedByName() async {
    return await _isar.projectModels.where().sortByProjectName().findAll();
  }

  // READ - Get projects by color tag
  Future<List<ProjectModel>> getProjectsByColor(int color) async {
    return await _isar.projectModels.filter().tagColorEqualTo(color).findAll();
  }

  // READ - Search projects by name (case-insensitive)
  Future<List<ProjectModel>> searchProjectsByName(String query) async {
    return await _isar.projectModels
        .filter()
        .projectNameContains(query, caseSensitive: false)
        .findAll();
  }

  // READ - Get projects with time goals
  Future<List<ProjectModel>> getProjectsWithTimeGoals() async {
    return await _isar.projectModels
        .filter()
        .hasTimeGoalEqualTo(true)
        .findAll();
  }

  // READ - Get projects by frequency type
  Future<List<ProjectModel>> getProjectsByFrequency(
    TimeGoalFrequency frequency,
  ) async {
    return await _isar.projectModels
        .filter()
        .timeGoalFrequencyEqualTo(frequency)
        .findAll();
  }

  // READ - Get recent projects (last 30 days)
  Future<List<ProjectModel>> getRecentProjects() async {
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
    return await _isar.projectModels
        .filter()
        .createdAtGreaterThan(thirtyDaysAgo)
        .sortByCreatedAtDesc()
        .findAll();
  }

  // UPDATE - Update existing project
  Future<int> updateProject(ProjectModel project) async {
    return await _isar.writeTxn(() async {
      project.updatedAt = DateTime.now();
      return await _isar.projectModels.put(project);
    });
  }

  // DELETE - Delete project by ID
  Future<bool> deleteProject(int id) async {
    return await _isar.writeTxn(() async {
      return await _isar.projectModels.delete(id);
    });
  }

  // DELETE - Delete multiple projects
  Future<int> deleteProjects(List<int> ids) async {
    return await _isar.writeTxn(() async {
      return await _isar.projectModels.deleteAll(ids);
    });
  }

  // DELETE - Delete all projects
  Future<void> deleteAllProjects() async {
    await _isar.writeTxn(() async {
      await _isar.projectModels.clear();
    });
  }

  // COUNT - Get total project count
  Future<int> getProjectCount() async {
    return await _isar.projectModels.count();
  }

  // WATCH - Stream of all projects (reactive)
  Stream<List<ProjectModel>> watchAllProjects() {
    return _isar.projectModels.where().watch(fireImmediately: true);
  }

  // WATCH - Stream of specific project (reactive)
  Stream<ProjectModel?> watchProject(int id) {
    return _isar.projectModels.watchObject(id, fireImmediately: true);
  }

  // BATCH - Create multiple projects
  Future<List<int>> createMultipleProjects(List<ProjectModel> projects) async {
    return await _isar.writeTxn(() async {
      final now = DateTime.now();
      for (var project in projects) {
        project.createdAt = now;
        project.updatedAt = now;
      }
      return await _isar.projectModels.putAll(projects);
    });
  }
}
