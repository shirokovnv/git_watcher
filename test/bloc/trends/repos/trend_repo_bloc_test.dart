import 'package:git_watcher/bloc/trends/repos/trend_repo_bloc.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/models/repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../data/repo/mock_trends_repo.dart';

void main() {
  group('TrendRepoBloc', () {
    late TrendRepoBloc bloc;
    late TrendsInterface trends;

    setUp(() {
      trends = MockTrendsRepo();
      bloc = TrendRepoBloc(trends: trends);
    });

    test('initial state is defined', () {
      expect(bloc.state, TrendRepoInitial());
    });

    group('test successful data flow', () {
      List<Repo> fakeRepos = [
        Repo('user', 'repo', 'repo/repo', 'example repo', null, 0)
      ];
      blocTest(
        'emits TrendRepoLoaded when successfully fetches repositories',
        build: () {
          when(() => trends.fetchRepos())
              .thenAnswer((_) => Future.value(fakeRepos));
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchTrendRepoEvent()),
        expect: () => [TrendRepoLoading(), TrendRepoLoaded(repos: fakeRepos)],
      );
    });

    group('test failed data flow', () {
      Exception e = Exception('Could not fetch repositories');

      blocTest(
        'emits TrendRepoError when coulnt fetch repositories',
        build: () {
          when(() => trends.fetchRepos()).thenThrow(e);
          return bloc;
        },
        act: (bloc) => bloc.add(const FetchTrendRepoEvent()),
        expect: () =>
            [TrendRepoLoading(), TrendRepoError(message: e.toString())],
      );
    });
  });
}
