part of 'exams_cubit.dart';

@immutable
sealed class ExamsState {}

final class ExamsInitial extends ExamsState {}

final class GetExamsLoading extends ExamsState {}

final class GetExamsSuccess extends ExamsState {}

final class GetExamsError extends ExamsState {
  String error;
  GetExamsError(this.error);
}
