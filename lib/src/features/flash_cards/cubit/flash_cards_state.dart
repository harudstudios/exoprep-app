part of 'flash_cards_cubit.dart';

@immutable
sealed class FlashCardsState {}

final class FlashCardsInitial extends FlashCardsState {}

final class LoadingState extends FlashCardsState {}

final class CreateCollectionErrorState extends FlashCardsState {}

final class CreateCollectionSuccessState extends FlashCardsState {}
