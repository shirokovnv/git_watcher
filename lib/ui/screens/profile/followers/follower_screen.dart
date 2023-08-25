import 'package:flutter/material.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/followers/widgets/follower_list_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_widget.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class FollowerScreen extends StatelessWidget {
  const FollowerScreen({super.key, required this.params});

  final FollowerScreenParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          context: context,
          title: params.followerType == FollowerType.followee
              ? 'Followee'
              : 'Followers',
          showBackButton: true),
      drawer: const TopDrawer(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        UserWidget(user: params.user),
        const FollowerListWidget()
      ]),
    );
  }
}
