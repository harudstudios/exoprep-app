import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:root/src/features/flash_cards/repository/flash_cards_repository.dart';
part 'flash_cards_state.dart';

class FlashCardsCubit extends Cubit<FlashCardsState> {
  FlashCardsCubit() : super(FlashCardsInitial());

  Future<void> saveCollection({required String title, required String tag, required String color}) async {
    emit(LoadingState());
    try {
      await FlashCardsRepository().saveCollection(title: title, tag: tag, color: color);
      emit(CreateCollectionSuccessState());
    } catch (e) {
      emit(CreateCollectionErrorState());
    }
  }
}
