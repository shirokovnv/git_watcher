import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/trends/widgets/trends_repo_widget.dart';
import 'package:git_watcher/ui/screens/trends/widgets/trends_user_widget.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tabs = const TabBar(tabs: [
      Tab(
        key: Key('repositories-tab'),
        icon: Icon(Icons.language_outlined),
        text: 'Repositories',
      ),
      Tab(
          key: Key('developers-tab'),
          icon: Icon(Icons.person_3_outlined),
          text: 'Developers')
    ]);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: appBar(context: context, title: 'Popular', tabs: tabs),
            drawer: const TopDrawer(),
            body: const Center(
              child: TabBarView(
                children: [TrendsRepoWidget(), TrendsUserWidget()],
              ),
            )));
  }
}
