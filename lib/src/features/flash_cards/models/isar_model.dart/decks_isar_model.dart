import 'package:isar_community/isar.dart';
import 'package:root/src/features/flash_cards/models/data_model/decks_data_model.dart';

part 'decks_isar_model.g.dart';

@collection
class DecksIsarModel {
  /// Isar Auto-Increment ID (1, 2, 3...)
  Id id = Isar.autoIncrement;

  String? name;

  @Index()
  String? collectionId;
  int? cardsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  /// 1. Default empty constructor (Required by Isar)
  DecksIsarModel();

  /// 2. Factory Constructor: Converts DataModel -> Isar Model
  factory DecksIsarModel.fromDataModel(DeckDataModel data) {
    final model = DecksIsarModel()
      ..name = data.name
      ..cardsCount = data.cardsCount
      ..collectionId = data.collectionId
      ..createdAt = data.createdAt != null ? DateTime.tryParse(data.createdAt!) : null
      ..updatedAt = data.updatedAt != null ? DateTime.tryParse(data.updatedAt!) : null
      ..deletedAt = data.deletedAt != null ? DateTime.tryParse(data.deletedAt!) : null;

    // Optional: If your DataModel ID happens to be a number string (e.g. "12"),
    // we can try to use it. Otherwise, Isar will generate a new one.
    if (data.id != null) {
      final parsedId = int.tryParse(data.id!);
      if (parsedId != null) {
        model.id = parsedId;
      }
    }

    return model;
  }
}
