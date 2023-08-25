import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/profile_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/ui/screens/profile/widgets/info_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/numbers_widget.dart';
import 'package:git_watcher/ui/screens/profile/widgets/user_form_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context, darkMode) {
      return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          color: darkMode ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InfoWidget(user: state is ProfileLoaded ? state.user : null),
                if (state is ProfileLoaded) NumbersWidget(user: state.user),
                const UserFormWidget(),
              ],
            ),
          ),
        );
      });
    });
  }
}
