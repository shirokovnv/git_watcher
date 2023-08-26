import 'package:flutter/material.dart';
import 'package:git_watcher/ui/shared/widgets/error_container.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context: context, title: 'Error'),
        drawer: const TopDrawer(),
        body: ErrorContainer(message: message));
  }
}
