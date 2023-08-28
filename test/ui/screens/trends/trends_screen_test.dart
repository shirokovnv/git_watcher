import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/ui/screens/trends/widgets/repo_list_widget.dart';
import 'package:git_watcher/ui/screens/trends/trends_screen.dart';
import 'package:git_watcher/ui/screens/trends/widgets/lang_choice_widget.dart';
import 'package:git_watcher/ui/screens/trends/widgets/trends_repo_widget.dart';
import 'package:git_watcher/ui/screens/trends/widgets/trends_user_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../helpers/mock_providers.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('TrendsScreen', () {
    testWidgets('renders TrendsScreen', (tester) async {
      List<Repo> fakeRepos = [
        Repo('user', 'repo', 'repo/repo', 'example repo', null, 0)
      ];

      List<User> fakeUsers = [
        User('user', 'user', 'company', 'email', 'avatarUrl', 'htmlUrl', null,
            0, 0, 0, 0)
      ];

      when(() => mockProviders.trends.fetchRepos())
          .thenAnswer((_) => Future.value(fakeRepos));

      when(() => mockProviders.trends.fetchDevelopers())
          .thenAnswer((_) => Future.value(fakeUsers));

      await tester.pumpApp(const TrendsScreen());

      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.text('Repositories'), findsOneWidget);
      expect(find.text('Developers'), findsOneWidget);

      expect(find.byType(TrendsRepoWidget), findsOneWidget);
      expect(find.byType(LangChoiceWidget), findsOneWidget);
      expect(find.byType(RepoListWidget), findsOneWidget);

      await tester.tap(find.text('Developers'));
      await mockNetworkImages(() async => await tester.pumpAndSettle());
      expect(find.byType(TrendsUserWidget), findsOneWidget);
    });
  });
}
