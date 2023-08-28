import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/ui/screens/profile/profile_screen.dart';
import 'package:git_watcher/ui/screens/profile/widgets/profile_widget.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('ProfileScreen', () {
    testWidgets('renders ProfileScreen', (tester) async {
      await tester.pumpApp(const ProfileScreen());
      expect(find.byType(ProfileWidget), findsOneWidget);
    });
  });
}
