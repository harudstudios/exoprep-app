import 'package:isar_community/isar.dart';
import 'package:root/data/local/database/isar_database.dart';
import 'package:root/data/models/project_model/project_schema_model.dart';

class ProjectLocalService {
  late final Isar _isar;
  bool _isInitialized = false;

  // Initialize service
  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    _isar = await IsarDatabase.getInstance();
    _isInitialized = true;
  }

  Stream<List<ProjectSchemaModel>> watchProjectsCreatedAfter({
    DateTime? date,
  }) {
    final startDate =
        date ??
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          0,
          1,
        );
    return _isar.projectSchemaModels
        .filter()
        .createdAtGreaterThan(startDate)
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }

  Stream<List<ProjectSchemaModel>> watchProjectsForDate(DateTime date) {
    final endOfDay = DateTime(
      date.year,
      date.month,
      date.day,
      23,
      59,
      59,
      999,
      999,
    );

    return _isar.projectSchemaModels
        .filter()
        .createdAtLessThan(endOfDay) // ← Changed from createdAtBetween
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }

  Future<int> createProject(ProjectSchemaModel project) async {
    return await _isar.writeTxn(() async {
      project.createdAt = DateTime.now();
      project.updatedAt = DateTime.now();
      return await _isar.projectSchemaModels.put(project);
    });
  }
}
