part of 'decks_view_cubit.dart';

@immutable
sealed class DecksViewState {}

final class DecksViewInitial extends DecksViewState {}

final class LoadingState extends DecksViewState {}

final class CreateDecksSuccessState extends DecksViewState {}

final class CreateDecksErrorState extends DecksViewState {
  final String message;

  CreateDecksErrorState(this.message);
}

final class DecksLoadedState extends DecksViewState {
  final List<DeckDataModel> collections;

  DecksLoadedState(this.collections);
}

final class LoadDecksErrorState extends DecksViewState {
  final String message;

  LoadDecksErrorState(this.message);
}
