import 'package:flutter/material.dart';
import 'package:git_watcher/data/models/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(user.login, style: const TextStyle(fontSize: 20))
        ]));
  }
}
