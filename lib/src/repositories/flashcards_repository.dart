import 'dart:developer';

import 'package:isar_community/isar.dart';
import 'package:root/data/local/database/isar_database.dart';

import 'package:root/src/features/flashcards/models/data_model/flash_cards_class_data_model.dart';
import 'package:root/src/features/flashcards/models/isar_model.dart/flash_cards_class_isar_model.dart';

class FlashcardRepository {
  Isar get _isar => IsarService.instance.isar;

  Future<int> writeFlashCardsClassToDB({required FlashCardsClassDataModel dataModel}) async {
    try {
      final isarModel = FlashCardsClassIsarModel().copyWith(
        title: dataModel.title,
        tag: dataModel.tag,
        colorHex: dataModel.color,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final id = await _isar.writeTxn(() async {
        return _isar.flashCardsClassIsarModels.put(isarModel);
      });

      log('✅ FlashCardsCollection saved successfully with ID: $id\n');
      log('✅ FlashCardsCollection Details: $isarModel');
      return id;
    } catch (e, stackTrace) {
      log('❌ Error saving FlashCardsCollection', error: e, stackTrace: stackTrace);

      throw Exception(e.toString());
    }
  }
}
