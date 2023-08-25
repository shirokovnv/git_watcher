part of 'trend_repo_bloc.dart';

sealed class TrendRepoState extends Equatable {
  const TrendRepoState();

  @override
  List<Object> get props => [];
}

final class TrendRepoInitial extends TrendRepoState {}

final class TrendRepoLoading extends TrendRepoState {}

final class TrendRepoLoaded extends TrendRepoState {
  final List<Repo> repos;

  const TrendRepoLoaded({required this.repos});

  @override
  List<Object> get props => [repos];
}
