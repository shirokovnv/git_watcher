import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/followers/follower_bloc.dart';
import 'package:git_watcher/bloc/profile/repos/repo_bloc.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';
import 'package:git_watcher/data/models/user.dart';
import 'package:git_watcher/router/routes_generator.dart';
import 'package:git_watcher/ui/screens/profile/followers/follower_screen_params.dart';
import 'package:git_watcher/ui/screens/profile/repos/repos_screen_params.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, user.publicRepos.toString(), 'Public repos',
              _showReposCallback),
          buildDivider(),
          buildButton(context, user.following.toString(), 'Following',
              _showFolloweeCallback),
          buildDivider(),
          buildButton(context, user.followers.toString(), 'Followers',
              _showFollowersCallback),
        ],
      ));
  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text,
          [Function? callback]) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {
          if (callback != null) {
            callback(context);
          }
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  _showFollowersScreen(BuildContext context, FollowerType followerType) {
    BlocProvider.of<FollowerBloc>(context).add(
        FetchFollowersEvent(userName: user.login, followerType: followerType));

    Navigator.of(context).pushNamed(RoutesGenerator.followersRoute,
        arguments:
            FollowerScreenParams(user: user, followerType: followerType));
  }

  _showFolloweeCallback(BuildContext context) =>
      _showFollowersScreen(context, FollowerType.followee);

  _showFollowersCallback(BuildContext context) =>
      _showFollowersScreen(context, FollowerType.follower);

  _showReposCallback(BuildContext context) {
    BlocProvider.of<RepoBloc>(context)
        .add(FetchRepoEvent(userName: user.login));

    Navigator.of(context).pushNamed(RoutesGenerator.reposRoute,
        arguments: ReposScreenParams(user: user));
  }
}
