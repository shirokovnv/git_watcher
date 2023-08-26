import 'package:git_watcher/bloc/profile/profile_bloc.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../data/repo/mock_users_repo.dart';

void main() {
  group('ProfileBloc', () {
    late ProfileBloc bloc;
    late UsersInterface users;

    setUp(() {
      users = MockUsersRepo();
      bloc = ProfileBloc(users: users);
    });

    test('initial state is defined', () {
      expect(bloc.state, ProfileInitial());
    });

    group('test successful data flow', () {
      User fakeUser = User('user', 'user', 'company', 'email', 'avatarUrl',
          'htmlUrl', null, 0, 0, 0, 0);
      blocTest(
        'emits ProfileLoaded when successfully fetches user',
        build: () {
          when(() => users.fetchUser('user'))
              .thenAnswer((_) => Future.value(fakeUser));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchUserEvent(userName: 'user')),
        expect: () => [ProfileLoading(), ProfileLoaded(user: fakeUser)],
      );
    });

    group('test failed data flow', () {
      Exception e = Exception('Could not fetch user');

      blocTest(
        'emits ProfileError when coulnt fetch user',
        build: () {
          when(() => users.fetchUser('user')).thenThrow(e);
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchUserEvent(userName: 'user')),
        expect: () => [ProfileLoading(), ProfileError(message: e.toString())],
      );
    });
  });
}
