import 'package:git_watcher/bloc/trends/users/trend_user_bloc.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../data/repo/mock_trends_repo.dart';

void main() {
  group('TrendUserBloc', () {
    late TrendUserBloc bloc;
    late TrendsInterface trends;

    setUp(() {
      trends = MockTrendsRepo();
      bloc = TrendUserBloc(trends: trends);
    });

    test('initial state is defined', () {
      expect(bloc.state, TrendUserInitial());
    });

    group('test successful data flow', () {
      List<User> fakeUsers = [
        User('user', 'user', 'company', 'email', 'avatarUrl', 'htmlUrl', null,
            0, 0, 0, 0)
      ];
      blocTest(
        'emits TrendUserLoaded when successfully fetches users',
        build: () {
          when(() => trends.fetchDevelopers())
              .thenAnswer((_) => Future.value(fakeUsers));
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTrendUserEvent()),
        expect: () => [TrendUserLoading(), TrendUserLoaded(users: fakeUsers)],
      );
    });

    group('test failed data flow', () {
      Exception e = Exception('Could not fetch users');

      blocTest(
        'emits TrendUserError when coulnt fetch users',
        build: () {
          when(() => trends.fetchDevelopers()).thenThrow(e);
          return bloc;
        },
        act: (bloc) => bloc.add(FetchTrendUserEvent()),
        expect: () =>
            [TrendUserLoading(), TrendUserError(message: e.toString())],
      );
    });
  });
}
