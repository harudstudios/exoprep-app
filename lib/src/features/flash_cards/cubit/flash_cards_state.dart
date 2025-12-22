part of 'flash_cards_cubit.dart';

@immutable
sealed class FlashCardsState {
  const FlashCardsState();
}

final class FlashCardsInitial extends FlashCardsState {}
