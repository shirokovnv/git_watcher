import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/data/interfaces/preferences_interface.dart';
import 'package:test/test.dart';
import '../data/repo/mock_prefs_repo.dart';

void main() {
  group('ThemeCubit', () {
    late ThemeCubit cubit;
    late PreferencesInterface prefs;

    setUp(() {
      prefs = MockPrefsRepo();
      cubit = ThemeCubit(prefs: prefs);
    });

    test('initial state is false', () {
      expect(cubit.state, isFalse);
    });

    test('toggles dark mode state', () {
      cubit.toggleDarkMode(true);
      cubit.toggleDarkMode(false);
      expect(cubit.stream, emitsInOrder([true, false]));
    });
  });
}
