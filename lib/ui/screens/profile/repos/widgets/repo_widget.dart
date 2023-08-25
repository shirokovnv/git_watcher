import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/data/models/repo.dart';

class RepoWidget extends StatelessWidget {
  const RepoWidget({super.key, required this.repo});

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context, darkMode) {
      var langColor = darkMode
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).primaryColorDark;

      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(children: [
            ListTile(
                title: Text(repo.name),
                subtitle: Text(repo.description ?? ''),
                leading: SizedBox(
                    width: 100,
                    child: Text(
                      repo.language ?? '',
                      style: TextStyle(color: langColor),
                    )),
                trailing: Column(children: [
                  Icon(
                    Icons.star_outlined,
                    color:
                        repo.stargazersCount > 0 ? Colors.orange : Colors.grey,
                  ),
                  if (repo.stargazersCount > 0)
                    Text(repo.stargazersCount.toString())
                ])),
            const Divider(height: 0)
          ]));
    });
  }
}
