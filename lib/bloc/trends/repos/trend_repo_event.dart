part of 'trend_repo_bloc.dart';

sealed class TrendRepoEvent extends Equatable {
  const TrendRepoEvent();

  @override
  List<Object> get props => [];
}

final class FetchTrendRepoEvent extends TrendRepoEvent {
  final String? lang;

  const FetchTrendRepoEvent([this.lang]);

  @override
  List<Object> get props => [lang ?? ''];
}
