import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/data/repo/preferences_repo.dart';
import 'package:git_watcher/data/repo/trends_repo.dart';
import 'package:git_watcher/data/repo/users_repo.dart';
import 'package:git_watcher/providers.dart';
import 'package:git_watcher/router/routes_generator.dart';

void main() {
  var providers = Providers(PreferencesRepo(), UsersRepo(), TrendsRepo());

  runApp(MainApp(providers: providers));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required Providers providers})
      : _providers = providers;

  final Providers _providers;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: _providers.getRepoProviders(),
        child: MultiBlocProvider(
            providers: Providers.getBlocProviders,
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
