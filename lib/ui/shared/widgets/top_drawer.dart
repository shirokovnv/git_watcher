import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/router/routes_generator.dart';

class NavigationItem {
  final String title;
  final IconData icon;
  final String path;

  NavigationItem({required this.title, required this.icon, required this.path});
}

var navigationItems = [
  NavigationItem(
      title: 'Profile',
      icon: Icons.person_2_outlined,
      path: RoutesGenerator.profileRoute),
  NavigationItem(
      title: 'Popular',
      icon: Icons.trending_up_outlined,
      path: RoutesGenerator.trendsRoute),
  NavigationItem(
      title: 'About',
      icon: Icons.info_outlined,
      path: RoutesGenerator.aboutRoute)
];

class TopDrawer extends StatelessWidget {
  const TopDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_buildHeader(context), _buildItems(context)],
      )));

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (_, darkMode) {
      var imagePath = darkMode
          ? 'assets/images/github-icon-light.png'
          : 'assets/images/github-icon-dark.png';

      var color = darkMode
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).primaryColorDark;

      var bgColor =
          darkMode ? Colors.transparent : Theme.of(context).primaryColorDark;

      return Container(
          padding: const EdgeInsets.all(20),
          color: color,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: bgColor,
                radius: 52,
                backgroundImage: AssetImage(imagePath),
              )
            ],
          ));
    });
  }

  Widget _buildItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(runSpacing: 16, children: [
        Column(
          children: [
            for (var item in navigationItems)
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.of(context).pushNamed(item.path);
                },
              )
          ],
        )
      ]));
}
