import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/followers/follower_bloc.dart';
import 'package:git_watcher/ui/screens/profile/followers/widgets/follower_widget.dart';
import 'package:git_watcher/ui/shared/widgets/circular_indicator.dart';

class FollowerListWidget extends StatelessWidget {
  const FollowerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowerBloc, FollowerState>(builder: (context, state) {
      if (state is FollowerInitial) {
        return const Center(child: Text('Not loaded yet...'));
      }

      if (state is FollowersLoading) {
        return const Center(child: CircularIndicator());
      }

      if (state is FollowersLoaded) {
        return state.followers.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.builder(
                        itemCount: state.followers.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return FollowerWidget(
                              follower: state.followers[index],
                              followerType: state.followerType);
                        })))
            : const Center(child: Text('No data'));
      }

      return const Center(child: Text('Unknown state'));
    });
  }
}
