import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/profile_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';

class UserFormWidget extends StatefulWidget {
  const UserFormWidget({super.key});

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  static final TextEditingController _userNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(builder: (context, darkMode) {
      return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        final textColor = darkMode ? Colors.white : Colors.black;
        final inputBgColor = darkMode ? Colors.white : Colors.black;

        return Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: inputBgColor.withOpacity(.1)),
            child: TextField(
              controller: _userNameCtrl,
              enabled: true,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                  errorText: state is ProfileError ? state.message : null,
                  border: InputBorder.none,
                  hintText: "Github username",
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Align(
              child: BlocProvider.of<ProfileBloc>(context).state
                      is ProfileLoading
                  ? CircularProgressIndicator(
                      backgroundColor: darkMode ? Colors.white : Colors.black,
                      strokeWidth: 2,
                    )
                  : Text(
                      'Get Profile',
                      style: TextStyle(color: textColor),
                    ),
            ),
            onPressed: () {
              BlocProvider.of<ProfileBloc>(context)
                  .add(FetchUserEvent(userName: _userNameCtrl.text));
            },
          )
        ]);
      });
    });
  }
}
