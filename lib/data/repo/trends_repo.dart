import 'dart:convert';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/models/repo.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/data/repo/mixins/github_config.dart';
import 'package:http/http.dart' as http;

class TrendsRepo with GithubConfig implements TrendsInterface {
  static const _trendsLimit = 5;

  @override
  Future<List<User>> fetchDevelopers() async {
    var response = await http.get(Uri.parse(
        '$url/search/users?q=followers:>0&sort=followers&order=desc&since=0'));

    List<User> result = List.empty(growable: true);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      Iterable items = data['items'];

      var requests = items
          .map((model) => http.get(Uri.parse(model['url'])))
          .toList()
          .sublist(0, _trendsLimit);

      var responses = await Future.wait(requests);

      for (var response in responses) {
        if (response.statusCode == 200) {
          result.add(User.fromJson(json.decode(response.body)));
        }
      }
    }

    return result;
  }

  @override
  Future<List<Repo>> fetchRepos([String? lang]) async {
    final List<String> q = [
      'stars:">0"',
      if (lang != null && lang != 'any') 'language:"$lang"',
      '&sort=stars',
      '&order=desc',
      '&since=0'
    ];

    var response =
        await http.get(Uri.parse('$url/search/repositories?q=${q.join()}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      Iterable items = data['items'];
      return items
          .map((model) => Repo.fromJson(model))
          .toList()
          .sublist(0, _trendsLimit);
    }

    return [];
  }
}
