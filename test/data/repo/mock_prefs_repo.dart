import 'package:git_watcher/data/interfaces/preferences_interface.dart';
import 'package:mocktail/mocktail.dart';

class MockPrefsRepo extends Mock implements PreferencesInterface {
  static bool _state = false;

  @override
  Future<void> setBool(String key, bool value) {
    _state = value;
    return Future.value();
  }

  @override
  Future<bool> getBool(String key) {
    return Future.value(_state);
  }
}
