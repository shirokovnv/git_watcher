import 'package:git_watcher/data/models/model.dart';

final class User extends Model {
  final String login;
  final String? name;
  final String? company;
  final String? email;
  final String avatarUrl;
  final String htmlUrl;
  final String? location;
  final int followers;
  final int following;
  final int publicRepos;
  final int publicGists;

  User(
      this.login,
      this.name,
      this.company,
      this.email,
      this.avatarUrl,
      this.htmlUrl,
      this.location,
      this.followers,
      this.following,
      this.publicRepos,
      this.publicGists);

  @override
  Map toJson() => {
        'login': login,
        'name': name,
        'company': company,
        'email': email,
        'avatar_url': avatarUrl,
        'html_url': htmlUrl,
        'location': location,
        'followers': followers,
        'following': following,
        'public_repos': publicRepos,
        'public_gists': publicGists
      };

  User.fromJson(Map json)
      : login = json['login'],
        name = json['name'],
        company = json['company'],
        email = json['email'],
        avatarUrl = json['avatar_url'],
        location = json['location'],
        htmlUrl = json['html_url'],
        followers = json['followers'] ?? 0,
        following = json['following'] ?? 0,
        publicRepos = json['public_repos'] ?? 0,
        publicGists = json['public_gists'] ?? 0;
}
