import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/cubit/theme_cubit.dart';
import 'package:git_watcher/data/models/user.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(children: [buildImage(), buildInfo()]));
  }

  Widget buildImage() {
    return BlocBuilder<ThemeCubit, bool>(builder: (_, darkMode) {
      final image = user is User
          ? NetworkImage(user!.avatarUrl)
          : darkMode
              ? const AssetImage('assets/images/github-icon-dark.png')
              : const AssetImage('assets/images/github-icon-light.png');

      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image as ImageProvider,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
          ),
        ),
      );
    });
  }

  Widget buildInfo() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            user?.name ?? 'Github',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          if (user?.email != null)
            buildText(user?.email ?? '', Icons.email_outlined),
          const SizedBox(height: 4),
          if (user?.company != null)
            buildText(user?.company ?? '', Icons.work_outlined),
          const SizedBox(height: 4),
          if (user?.location != null)
            buildText(user?.location ?? '', Icons.location_on_outlined),
          const SizedBox(height: 8),
        ],
      );

  Widget buildText(String text, IconData icon) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          child: Text(text, style: const TextStyle(color: Colors.grey)))
    ]);
  }
}
