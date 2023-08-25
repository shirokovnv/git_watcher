import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/trends/widgets/lang_choice_widget.dart';
import 'package:git_watcher/ui/screens/trends/widgets/repo_list_widget.dart';

class TrendsRepoWidget extends StatelessWidget {
  const TrendsRepoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [LangChoiceWidget(), RepoListWidget()]);
  }
}
