import 'package:git_watcher/data/models/model.dart';

class Repo extends Model {
  final String author;
  final String name;
  final String fullName;
  final String? description;
  final String? language;
  final int stargazersCount;

  Repo(this.author, this.name, this.fullName, this.description, this.language,
      this.stargazersCount);

  @override
  Map toJson() => {
        'author': author,
        'name': name,
        'full_name': fullName,
        'description': description,
        'language': language,
        'stargazers_count': stargazersCount
      };

  Repo.fromJson(Map json)
      : author = json['owner']['login'],
        name = json['name'],
        fullName = json['full_name'],
        description = json['description'],
        language = json['language'],
        stargazersCount = json['stargazers_count'];
}
