import 'package:bloc/bloc.dart';
import 'package:git_watcher/data/interfaces/preferences_interface.dart';

class ThemeCubit extends Cubit<bool> {
  static const _keyIsDarkModeEnabled = 'isDarkModeEnabled';

  final PreferencesInterface _prefs;

  ThemeCubit({required PreferencesInterface prefs})
      : _prefs = prefs,
        super(false);

  Future<void> isDarkModeEnabled() async {
    emit(await _prefs.getBool(ThemeCubit._keyIsDarkModeEnabled));
  }

  Future<void> toggleDarkMode(bool newValue) async {
    await _prefs.setBool(ThemeCubit._keyIsDarkModeEnabled, newValue);
    emit(newValue);
  }
}
