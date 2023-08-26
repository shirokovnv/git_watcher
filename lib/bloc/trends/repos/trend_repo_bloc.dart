import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/models/repo.dart';

part 'trend_repo_event.dart';
part 'trend_repo_state.dart';

class TrendRepoBloc extends Bloc<TrendRepoEvent, TrendRepoState> {
  final TrendsInterface _trends;

  TrendRepoBloc({required TrendsInterface trends})
      : _trends = trends,
        super(TrendRepoInitial()) {
    on<FetchTrendRepoEvent>(_onFetchTrendRepo);
  }

  _onFetchTrendRepo(
      FetchTrendRepoEvent event, Emitter<TrendRepoState> emit) async {
    emit(TrendRepoLoading());

    try {
      List<Repo> repos = await _trends.fetchRepos(event.lang);
      emit(TrendRepoLoaded(repos: repos));
    } on Exception catch (e) {
      emit(TrendRepoError(message: e.toString()));
    }
  }
}
