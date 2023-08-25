import 'package:flutter/material.dart';
import 'package:git_watcher/data/models/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(user.avatarUrl)),
                  Text(
                    user.login,
                    style: const TextStyle(fontSize: 16.0),
                  )
                ])));
  }
}
