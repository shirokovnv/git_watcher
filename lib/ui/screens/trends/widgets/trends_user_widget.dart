import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/trends/widgets/user_list_widget.dart';

class TrendsUserWidget extends StatelessWidget {
  const TrendsUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text('Most popular people on Github',
                  style: TextStyle(fontSize: 22.0))),
          UserListWidget(),
        ]);
  }
}
