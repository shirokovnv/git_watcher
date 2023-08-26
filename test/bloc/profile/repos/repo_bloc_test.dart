import 'package:git_watcher/bloc/profile/repos/repo_bloc.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../data/repo/mock_users_repo.dart';

void main() {
  group('RepoBloc', () {
    late RepoBloc bloc;
    late UsersInterface users;

    setUp(() {
      users = MockUsersRepo();
      bloc = RepoBloc(users: users);
    });

    test('initial state is defined', () {
      expect(bloc.state, RepoInitial());
    });

    group('test successful data flow', () {
      List<Repo> fakeRepos = [
        Repo('user', 'repo', 'repo/repo', 'example repo', null, 0)
      ];
      blocTest(
        'emits RepoLoaded when successfully fetches repositories',
        build: () {
          when(() => users.fetchPublicRepos('user'))
              .thenAnswer((_) => Future.value(fakeRepos));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchRepoEvent(userName: 'user')),
        expect: () => [RepoLoading(), RepoLoaded(repos: fakeRepos)],
      );
    });

    group('test failed data flow', () {
      Exception e = Exception('Could not fetch repositories');

      blocTest(
        'emits RepoError when coulnt fetch repositories',
        build: () {
          when(() => users.fetchPublicRepos('user')).thenThrow(e);
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchRepoEvent(userName: 'user')),
        expect: () => [RepoLoading(), RepoError(message: e.toString())],
      );
    });
  });
}
