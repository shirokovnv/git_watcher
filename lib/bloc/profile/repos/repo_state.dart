part of 'repo_bloc.dart';

sealed class RepoState extends Equatable {
  const RepoState();

  @override
  List<Object> get props => [];
}

final class RepoInitial extends RepoState {}

final class RepoLoading extends RepoState {}

final class RepoLoaded extends RepoState {
  final List<Repo> repos;

  const RepoLoaded({required this.repos});

  @override
  List<Object> get props => [repos];
}
