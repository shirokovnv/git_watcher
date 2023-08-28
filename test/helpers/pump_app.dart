import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_watcher/main.dart';
import 'package:git_watcher/providers.dart';
import 'mock_providers.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpWholeApp({Providers? providers}) {
    return pumpWidget(MainApp(providers: providers ?? mockProviders));
  }

  Future<void> pumpApp(Widget widget, {Providers? providers}) {
    return pumpWidget(MultiRepositoryProvider(
        providers:
            providers?.getRepoProviders() ?? mockProviders.getRepoProviders(),
        child: MultiBlocProvider(
            providers: Providers.getBlocProviders,
            child: MaterialApp(home: Scaffold(body: widget)))));
  }

  Future<void> pumpRoute(Route<dynamic> route) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
    );
  }
}
