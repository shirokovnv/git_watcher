import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_form_widget.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../helpers/mock_providers.dart';
import '../../../../helpers/pump_app.dart';

void main() {
  group('Profile/UserFormWidget', () {
    testWidgets('renders UserFormWidget', (tester) async {
      await tester.pumpApp(const UserFormWidget());

      expect(find.byType(TextField), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('renders user profile on correct User Input', (tester) async {
      User fakeUser = User('user', 'user', 'company', 'email', 'avatarUrl',
          'htmlUrl', null, 0, 0, 0, 0);

      when(() => mockProviders.users.fetchUser('user'))
          .thenAnswer((_) => Future.value(fakeUser));

      await tester.pumpApp(const UserFormWidget());
      await tester.enterText(find.byType(TextField), 'user');
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(find.text('Not found'), findsNothing);
    });

    testWidgets('renders not found message on incorrect User Input',
        (tester) async {
      when(() => mockProviders.users.fetchUser('user'))
          .thenThrow(Exception('Not found'));

      await tester.pumpApp(const UserFormWidget());
      await tester.enterText(find.byType(TextField), 'user');
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      expect(find.text('Exception: Not found'), findsOneWidget);
    });
  });
}
