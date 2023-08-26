import 'package:git_watcher/bloc/profile/followers/follower_bloc.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../data/repo/mock_users_repo.dart';

void main() {
  group('FollowerBloc', () {
    late FollowerBloc bloc;
    late UsersInterface users;

    setUp(() {
      users = MockUsersRepo();
      bloc = FollowerBloc(users: users);
    });

    test('initial state is defined', () {
      expect(bloc.state, FollowerInitial());
    });

    group('test successful data flow', () {
      List<User> fakeFollowers = [
        User('user', 'user', 'company', 'email', 'avatarUrl', 'htmlUrl', null,
            0, 0, 0, 0)
      ];
      blocTest(
        'emits FollowersLoaded when successfully fetches followers',
        build: () {
          when(() => users.fetchFollowers('user', FollowerType.follower))
              .thenAnswer((_) => Future.value(fakeFollowers));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchFollowersEvent(
            userName: 'user', followerType: FollowerType.follower)),
        expect: () => [
          FollowersLoading(),
          FollowersLoaded(
              followers: fakeFollowers, followerType: FollowerType.follower)
        ],
      );
    });

    group('test failed data flow', () {
      Exception e = Exception('Could not fetch followers');

      blocTest(
        'emits FollowerError when coulnt fetch followers',
        build: () {
          when(() => users.fetchFollowers('user', FollowerType.follower))
              .thenThrow(e);
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchFollowersEvent(
            userName: 'user', followerType: FollowerType.follower)),
        expect: () =>
            [FollowersLoading(), FollowerError(message: e.toString())],
      );
    });
  });
}
