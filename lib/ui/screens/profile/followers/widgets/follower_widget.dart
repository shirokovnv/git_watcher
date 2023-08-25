import 'package:flutter/material.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';

class FollowerWidget extends StatelessWidget {
  const FollowerWidget(
      {super.key, required this.follower, required this.followerType});

  final User follower;
  final FollowerType followerType;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(children: [
          ListTile(
              title: Text(follower.login),
              subtitle: Text(follower.name ?? ''),
              leading: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(follower.avatarUrl)),
              trailing: Text(followerType == FollowerType.followee
                  ? 'following'
                  : 'follower')),
          const Divider(height: 0)
        ]));
  }
}
