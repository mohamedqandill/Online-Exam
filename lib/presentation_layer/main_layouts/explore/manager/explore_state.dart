part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class GetSubjectsLoading extends ExploreState {}

final class GetSubjectsSuccess extends ExploreState {}

final class GetSubjectsError extends ExploreState {
  String error;
  GetSubjectsError(this.error);
}
