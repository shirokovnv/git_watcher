import 'package:git_watcher/data/interfaces/preferences_interface.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';

class DependencyContainer {
  final PreferencesInterface prefs;
  final UsersInterface users;
  final TrendsInterface trends;

  const DependencyContainer(this.prefs, this.users, this.trends);
}
