part of 'leaderboard_cubit.dart';

@immutable
sealed class LeaderboardState {}

final class LeaderboardInitial extends LeaderboardState {}

final class LeaderboardLoadingState extends LeaderboardState {}

final class ErrorState extends LeaderboardState {
  final String err;
  ErrorState({this.err = 'Unknown error occured'});
}

final class LeaderboardLeafExamsGetSuccessState extends LeaderboardState {}

final class LeaderboardLeafExamsGetErrorState extends ErrorState {
  final String err;
  LeaderboardLeafExamsGetErrorState({this.err = 'Unknown error occured'});
}

final class LeaderboardDataSuccessState extends LeaderboardState {}

final class LeaderboardDataErrorState extends ErrorState {
  final String err;
  LeaderboardDataErrorState({this.err = 'Unknown error occured'});
}
