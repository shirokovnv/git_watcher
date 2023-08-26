import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/repo.dart';

part 'repo_event.dart';
part 'repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final UsersInterface _users;

  RepoBloc({required UsersInterface users})
      : _users = users,
        super(RepoInitial()) {
    on<FetchRepoEvent>(_onFetchRepo);
  }

  _onFetchRepo(FetchRepoEvent event, Emitter<RepoState> emit) async {
    emit(RepoLoading());

    try {
      var repos = await _users.fetchPublicRepos(event.userName);
      emit(RepoLoaded(repos: repos));
    } on Exception catch (e) {
      emit(RepoError(message: e.toString()));
    }
  }
}
