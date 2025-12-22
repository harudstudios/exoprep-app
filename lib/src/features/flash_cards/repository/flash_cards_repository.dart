import 'package:isar_community/isar.dart';
import 'package:root/data/local/database/isar_database.dart';
import 'package:root/src/features/flash_cards/models/isar_model.dart/flash_cards_collection_isar_model.dart';

class FlashCardsRepository {
  Isar get _isar => IsarService.instance.isar;

  Future<void> saveCollection({required String title, required String tag, required String color}) async {
    final isarModel = FlashCardsCollectionIsarModel()
      ..title = title
      ..tag = tag.toLowerCase().trim()
      ..colorHex = color
      ..cardCount = 0
      ..deckIds = []
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.flashCardsCollectionIsarModels.put(isarModel);
    });
  }
}
