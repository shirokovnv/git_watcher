import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/models/user.dart';

abstract class TrendsInterface {
  Future<List<Repo>> fetchRepos([String? lang]);
  Future<List<User>> fetchDevelopers();
}
