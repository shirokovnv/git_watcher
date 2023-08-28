import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/followers/follower_bloc.dart';
import 'package:git_watcher/bloc/profile/profile_bloc.dart';
import 'package:git_watcher/bloc/profile/repos/repo_bloc.dart';
import 'package:git_watcher/bloc/trends/repos/trend_repo_bloc.dart';
import 'package:git_watcher/bloc/trends/users/trend_user_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/data/interfaces/preferences_interface.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/interfaces/users_interface.dart';

class Providers {
  final PreferencesInterface _prefs;
  final UsersInterface _users;
  final TrendsInterface _trends;

  const Providers(
      PreferencesInterface prefs, UsersInterface users, TrendsInterface trends)
      : _prefs = prefs,
        _users = users,
        _trends = trends;

  getRepoProviders() {
    return [
      RepositoryProvider<PreferencesInterface>(
        create: (_) => _prefs,
      ),
      RepositoryProvider<UsersInterface>(create: (_) => _users),
      RepositoryProvider<TrendsInterface>(create: (_) => _trends)
    ];
  }

  static get getBlocProviders => [
        BlocProvider(
            create: (context) => ThemeCubit(
                prefs: RepositoryProvider.of<PreferencesInterface>(context))),
        BlocProvider(
            create: (context) => ProfileBloc(
                users: RepositoryProvider.of<UsersInterface>(context))),
        BlocProvider(
            create: (context) => FollowerBloc(
                users: RepositoryProvider.of<UsersInterface>(context))),
        BlocProvider(
            create: (context) => RepoBloc(
                users: RepositoryProvider.of<UsersInterface>(context))),
        BlocProvider(
            create: (context) => TrendRepoBloc(
                trends: RepositoryProvider.of<TrendsInterface>(context))),
        BlocProvider(
            create: (context) => TrendUserBloc(
                trends: RepositoryProvider.of<TrendsInterface>(context)))
      ];
}
