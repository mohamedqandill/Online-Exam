part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

final class GetQuizLoading extends QuizState {}

final class GetQuizSuccess extends QuizState {}

final class GetQuizError extends QuizState {
  String error;
  GetQuizError(this.error);
}
