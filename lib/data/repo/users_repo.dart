import 'dart:convert';
import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/data/repo/mixins/github_config.dart';
import 'package:http/http.dart' as http;

class UsersRepo with GithubConfig implements UsersInterface {
  @override
  Future<User> fetchUser(String userName) async {
    var data = await http.get(Uri.parse('$url/users/$userName'));

    if (data.statusCode == 200) {
      return User.fromJson(json.decode(data.body));
    }

    return errorResponse(data.statusCode);
  }

  @override
  Future<List<User>> fetchFollowers(String userName, FollowerType type) async {
    final Uri uri = Uri.parse(
        '$url/users/$userName/${type == FollowerType.followee ? 'following' : 'followers'}');

    final data = await http.get(uri);

    if (data.statusCode == 200) {
      Iterable list = json.decode(data.body);
      return list.map((model) => User.fromJson(model)).toList();
    }

    return errorResponse(data.statusCode);
  }

  @override
  Future<List<Repo>> fetchPublicRepos(String userName) async {
    final data = await http.get(Uri.parse('$url/users/$userName/repos'));

    if (data.statusCode == 200) {
      Iterable list = json.decode(data.body);
      List<Repo> result = list.map((model) => Repo.fromJson(model)).toList();

      result.sort((a, b) => b.stargazersCount.compareTo(a.stargazersCount));
      return result;
    }

    return errorResponse(data.statusCode);
  }
}
