import 'package:flutter/material.dart';
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
import 'package:git_watcher/data/repo/preferences_repo.dart';
import 'package:git_watcher/data/repo/trends_repo.dart';
import 'package:git_watcher/data/repo/users_repo.dart';
import 'package:git_watcher/router/routes_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PreferencesInterface>(
            create: (_) => PreferencesRepo(),
          ),
          RepositoryProvider<UsersInterface>(create: (_) => UsersRepo()),
          RepositoryProvider<TrendsInterface>(create: (_) => TrendsRepo())
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ThemeCubit(
                      prefs: RepositoryProvider.of<PreferencesInterface>(
                          context))),
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
            ],
            child: BlocBuilder<ThemeCubit, bool>(builder: (_, darkMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                theme: darkMode ? ThemeData.dark() : ThemeData.light(),
                onGenerateRoute: RoutesGenerator.generateRoute,
              );
            })));
  }
}
