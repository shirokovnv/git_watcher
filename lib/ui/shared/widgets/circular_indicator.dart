import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context, darkMode) {
      return CircularProgressIndicator(
        backgroundColor: darkMode ? Colors.white : Colors.black,
        strokeWidth: 2,
      );
    });
  }
}
