//
// ignore_for_file:!unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:root/src/features/flash_cards/models/data_model/flash_cards_collection_data_model.dart';
import 'package:root/src/repositories/flashcards_repository.dart';

class FlashcardViewModel {
  final FlashcardRepository _repository = FlashcardRepository();

  FlashcardViewModel();

  // ValueNotifiers for reactive state
  final ValueNotifier<bool> isLoadingNotifier = ValueNotifier(false);

  // Initialize
  Future<void> initialize() async {
    // !TODO: Load initial data
  }

  Future<void> createFlashCardsCollection(FlashCardsCollectionDataModel dataModel) async {
    try {
      await _repository.writeFlashCardsClassToDB(dataModel: dataModel);
    } catch (e) {
      log(e.toString());
    }
  }

  // Dispose all notifiers
  void dispose() {
    isLoadingNotifier.dispose();
  }
}
