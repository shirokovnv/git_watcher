import 'package:flutter/material.dart';
import 'package:git_watcher/ui/screens/about/about_screen.dart';
import 'package:git_watcher/ui/screens/error/error_screen.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/profile_screen.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen_params.dart';
import 'package:git_watcher/ui/screens/trends/trends_screen.dart';

class RoutesGenerator {
  static const profileRoute = '/';
  static const followersRoute = '/profile/followers';
  static const reposRoute = '/profile/repos';
  static const trendsRoute = '/trends';
  static const aboutRoute = '/about';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final params = settings.arguments;

    return MaterialPageRoute(builder: (_) {
      switch (settings.name) {
        case RoutesGenerator.profileRoute:
          return const ProfileScreen();
        case RoutesGenerator.followersRoute:
          return FollowerScreen(params: params as FollowerScreenParams);
        case RoutesGenerator.reposRoute:
          return ReposScreen(params: params as ReposScreenParams);
        case RoutesGenerator.trendsRoute:
          return const TrendsScreen();
        case RoutesGenerator.aboutRoute:
          return const AboutScreen();
        default:
          return const ErrorScreen(message: "NOT FOUND");
      }
    });
  }
}
