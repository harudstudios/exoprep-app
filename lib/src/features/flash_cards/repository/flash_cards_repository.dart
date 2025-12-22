import 'package:isar_community/isar.dart';
import 'package:root/data/local/database/isar_database.dart';
import 'package:root/src/features/flash_cards/models/data_model/decks_data_model.dart';
import 'package:root/src/features/flash_cards/models/data_model/flash_cards_collection_data_model.dart';
import 'package:root/src/features/flash_cards/models/isar_model.dart/decks_isar_model.dart';
import 'package:root/src/features/flash_cards/models/isar_model.dart/flash_cards_collection_isar_model.dart';

class FlashCardsRepository {
  Isar get _isar => IsarService.instance.isar;

  Future<void> saveCollection({required String title, required String tag, required int color}) async {
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

  Stream<List<FlashCardsCollectionDataModel>> watchCollection() {
    return _isar.flashCardsCollectionIsarModels
        .where()
        .filter()
        .deletedAtIsNull()
        .watch(fireImmediately: true)
        .map((isarModels) => isarModels.map((isarModel) => _toDataModel(isarModel)).toList());
  }

  Stream<List<DeckDataModel>> watchDecksList(String collectionId) {
    return _isar.decksIsarModels
        .filter()
        .collectionIdEqualTo(collectionId)
        .and()
        .deletedAtIsNull()
        .watch(fireImmediately: true)
        .map((isarModels) => isarModels.map((isarModel) => _toDecksDataModel(isarModel)).toList());
  }

  Future<void> saveDecks({required String name, required String collectionId}) async {
    final isarModel = DecksIsarModel()
      ..name = name
      ..collectionId = collectionId
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.decksIsarModels.put(isarModel);
    });
  }
}

DeckDataModel _toDecksDataModel(DecksIsarModel isarModel) {
  return DeckDataModel(
    id: isarModel.id.toString(), // Convert Isar Int ID back to String
    name: isarModel.name,
    collectionId: isarModel.collectionId,
    createdAt: isarModel.createdAt?.toIso8601String(),
    updatedAt: isarModel.updatedAt?.toIso8601String(),
    deletedAt: isarModel.deletedAt?.toIso8601String(),
  );
}

FlashCardsCollectionDataModel _toDataModel(FlashCardsCollectionIsarModel isarModel) {
  return FlashCardsCollectionDataModel(
    id: isarModel.id.toString(),
    title: isarModel.title,
    tag: isarModel.tag,
    color: isarModel.colorHex,
    cardCount: isarModel.cardCount,
    deckIds: isarModel.deckIds,
    createdAt: isarModel.createdAt?.toIso8601String(),
    updatedAt: isarModel.updatedAt?.toIso8601String(),
    deletedAt: isarModel.deletedAt?.toIso8601String(),
  );
}
