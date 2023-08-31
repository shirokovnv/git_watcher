import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/ui/screens/about/about_screen.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('AboutScreen', () {
    testWidgets('renders AboutScreen', (tester) async {
      await tester.pumpApp(const AboutScreen());
      expect(find.byType(AboutListTile), findsOneWidget);
      await tester.tap(find.byType(AboutListTile));
      await tester.pump();
      expect(find.byType(ListTile), findsNWidgets(5));
    });
  });
}
