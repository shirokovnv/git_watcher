import 'package:git_watcher/data/interfaces/preferences_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepo implements PreferencesInterface {
  @override
  Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  @override
  Future<void> setBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
