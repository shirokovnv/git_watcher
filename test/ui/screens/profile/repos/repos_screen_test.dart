import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/repos/widgets/repo_list_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../helpers/mock_providers.dart';
import '../../../../helpers/pump_app.dart';

void main() {
  group('Profile/ReposScreen', () {
    testWidgets('renders ReposScreen', (tester) async {
      var fakeUser = User('user', 'user', 'company', 'email', 'avatarUrl',
          'htmlUrl', null, 0, 0, 0, 0);

      List<Repo> emptyRepos = [];

      when(() => mockProviders.users.fetchPublicRepos('user'))
          .thenAnswer((_) => Future.value(emptyRepos));

      await mockNetworkImages(() async => await tester
          .pumpApp(ReposScreen(params: ReposScreenParams(user: fakeUser))));

      expect(find.byType(UserWidget), findsOneWidget);
      expect(find.byType(RepoListWidget), findsOneWidget);
    });
  });
}
