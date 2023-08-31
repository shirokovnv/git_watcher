import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/followers/widgets/follower_list_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_widget.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../../../helpers/mock_providers.dart';
import '../../../../helpers/pump_app.dart';

void main() {
  group('Profile/FollowerScreen', () {
    testWidgets('renders FollowerScreen', (tester) async {
      var fakeUser = User('user', 'user', 'company', 'email', 'avatarUrl',
          'htmlUrl', null, 0, 0, 0, 0);

      List<User> emptyFollowers = [];

      when(() =>
              mockProviders.users.fetchFollowers('user', FollowerType.follower))
          .thenAnswer((_) => Future.value(emptyFollowers));

      await mockNetworkImages(() async => await tester.pumpApp(FollowerScreen(
          params: FollowerScreenParams(
              user: fakeUser, followerType: FollowerType.follower))));

      expect(find.byType(UserWidget), findsOneWidget);
      expect(find.byType(FollowerListWidget), findsOneWidget);
    });
  });
}
