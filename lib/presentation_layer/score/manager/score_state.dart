part of 'score_cubit.dart';

@immutable
sealed class ScoreState {}

final class ScoreInitial extends ScoreState {}

final class GetScoreLoading extends ScoreState {}

final class GetScoreSuccess extends ScoreState {}

final class GetScoreError extends ScoreState {
  String? error;
  GetScoreError(this.error);
}
