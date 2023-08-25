import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/profile/widgets/profile_widget.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context, title: 'Profile'),
      drawer: const TopDrawer(),
      body: const ProfileWidget(),
    );
  }
}
