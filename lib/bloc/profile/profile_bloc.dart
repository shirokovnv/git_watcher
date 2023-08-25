import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UsersInterface _users;

  ProfileBloc({required UsersInterface users})
      : _users = users,
        super(ProfileInitial()) {
    on<FetchUserEvent>(_onFetchUser);
  }

  Future<void> _onFetchUser(
      FetchUserEvent event, Emitter<ProfileState> emit) async {
    if (event.userName == '') {
      emit(const ProfileError(message: 'The username is required'));
      return;
    }

    emit(ProfileLoading());
    var user = await _users.fetchUser(event.userName);

    user is User
        ? emit(ProfileLoaded(user: user))
        : emit(const ProfileError(message: "Not found"));
  }
}
