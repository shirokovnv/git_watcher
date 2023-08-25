import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';

part 'follower_event.dart';
part 'follower_state.dart';

class FollowerBloc extends Bloc<FollowerEvent, FollowerState> {
  final UsersInterface _users;

  FollowerBloc({required UsersInterface users})
      : _users = users,
        super(FollowerInitial()) {
    on<FetchFollowersEvent>(_onFetchFollowers);
  }

  Future<void> _onFetchFollowers(
      FetchFollowersEvent event, Emitter<FollowerState> emit) async {
    emit(FollowersLoading());
    var followers =
        await _users.fetchFollowers(event.userName, event.followerType);
    emit(FollowersLoaded(
        followers: followers, followerType: event.followerType));
  }
}
