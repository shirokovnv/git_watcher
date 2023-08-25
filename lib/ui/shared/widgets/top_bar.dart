import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';

AppBar appBar(
    {required BuildContext context,
    required String title,
    bool showBackButton = false,
    PreferredSizeWidget? tabs}) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.blue.shade700,
    leading: showBackButton
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        : null,
    bottom: tabs,
    actions: [
      BlocBuilder<ThemeCubit, bool>(builder: (context, darkMode) {
        IconData iconDark = Icons.wb_sunny;
        IconData iconLight = Icons.nights_stay;

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
            child: IconButton(
              icon: Icon(darkMode ? iconDark : iconLight),
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).toggleDarkMode(!darkMode);
              },
            ));
      })
    ],
  );
}
