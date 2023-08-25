part of 'repo_bloc.dart';

sealed class RepoEvent extends Equatable {
  const RepoEvent();

  @override
  List<Object> get props => [];
}

final class FetchRepoEvent extends RepoEvent {
  final String userName;

  const FetchRepoEvent({required this.userName});

  @override
  List<Object> get props => [userName];
}
