import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/ui/screens/error/error_screen.dart';
import 'package:git_watcher/ui/shared/widgets/error_container.dart';
import '../../../helpers/pump_app.dart';

void main() {
  group('ErrorScreen', () {
    testWidgets('renders ErrorScreen', (tester) async {
      const String message = 'example error';
      await tester.pumpApp(const ErrorScreen(message: message));
      expect(find.byType(ErrorContainer), findsOneWidget);
      expect(find.text(message), findsOneWidget);
    });
  });
}
