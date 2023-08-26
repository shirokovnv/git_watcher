import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/models/user.dart';

enum FollowerType { followee, follower }

abstract class UsersInterface {
  Future<User> fetchUser(String userName);
  Future<List<User>> fetchFollowers(String userName, FollowerType type);
  Future<List<Repo>> fetchPublicRepos(String userName);
}
