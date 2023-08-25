import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/repos/widgets/repo_list_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_widget.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class ReposScreen extends StatelessWidget {
  const ReposScreen({super.key, required this.params});

  final ReposScreenParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context: context, title: 'Public repos', showBackButton: true),
      drawer: const TopDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserWidget(user: params.user), const RepoListWidget()]),
    );
  }
}
