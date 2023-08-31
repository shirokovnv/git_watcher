import 'package:flutter/material.dart';
import 'package:git_watcher/ui/shared/widgets/top_bar.dart';
import 'package:git_watcher/ui/shared/widgets/top_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context: context, title: 'About'),
        drawer: const TopDrawer(),
        body: Center(
            child: AboutListTile(
                icon: const Icon(Icons.info),
                applicationName: 'Git Watcher',
                applicationVersion: '1.0.0',
                aboutBoxChildren: [
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  const Text('Application for working with Github REST Api.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  const Divider(height: 0),
                  const Text('What can it do?',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 16.0)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ListView(
                        children: const [
                          ListTile(
                              leading: Text('1'),
                              title: Text(
                                  'View user profile, followers and repos')),
                          ListTile(
                              leading: Text('2'),
                              title: Text(
                                  'Search for popular repos and developers')),
                          ListTile(
                              leading: Text('3'),
                              title: Text('Switch dark/light theme :)')),
                          ListTile(
                            leading: Text('Limitations:',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            title: Text('Only 60 requests per hour is allowed.',
                                style: TextStyle(fontStyle: FontStyle.italic)),
                          )
                        ],
                      ))
                ],
              )
            ])));
  }
}
