part of 'flash_cards_cubit.dart';

@immutable
sealed class FlashCardsState {}

final class FlashCardsInitial extends FlashCardsState {}

final class LoadingState extends FlashCardsState {}

final class CreateCollectionSuccessState extends FlashCardsState {}

final class CreateCollectionErrorState extends FlashCardsState {
  final String message;

  CreateCollectionErrorState(this.message);
}

final class CollectionsLoadedState extends FlashCardsState {
  final List<FlashCardsCollectionDataModel> collections;

  CollectionsLoadedState(this.collections);
}

final class LoadCollectionsErrorState extends FlashCardsState {
  final String message;

  LoadCollectionsErrorState(this.message);
}
