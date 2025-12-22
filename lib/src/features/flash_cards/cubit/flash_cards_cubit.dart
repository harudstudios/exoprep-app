import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:root/src/features/flash_cards/models/data_model/flash_cards_collection_data_model.dart';
import 'package:root/src/features/flash_cards/repository/flash_cards_repository.dart';

part 'flash_cards_state.dart';

class FlashCardsCubit extends Cubit<FlashCardsState> {
  FlashCardsCubit() : super(FlashCardsInitial()) {
    _initializeCollections();
  }

  StreamSubscription<List<FlashCardsCollectionDataModel>>? _collectionsSubscription;

  final FlashCardsRepository _repository = FlashCardsRepository();
  List<FlashCardsCollectionDataModel> collections = [];

  void _initializeCollections() {
    emit(LoadingState());

    _collectionsSubscription = _repository.watchCollection().listen(
      (updatedCollections) {
        collections = updatedCollections;
        emit(CollectionsLoadedState(collections));
        log('Collections length: ${collections.length}');
      },

      onError: (error) {
        emit(LoadCollectionsErrorState(error.toString()));
      },
    );
  }

  Future<void> saveCollection({required String title, required String tag, required int color}) async {
    emit(LoadingState());
    try {
      await _repository.saveCollection(title: title, tag: tag, color: color);
      emit(CreateCollectionSuccessState());
    } catch (e) {
      emit(CreateCollectionErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _collectionsSubscription?.cancel();
    return super.close();
  }
}
