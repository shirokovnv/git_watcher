import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/profile/repos/repo_bloc.dart';
import 'package:git_watcher/ui/screens/profile/repos/widgets/repo_widget.dart';
import 'package:git_watcher/ui/shared/widgets/circular_indicator.dart';
import 'package:git_watcher/ui/shared/widgets/error_container.dart';

class RepoListWidget extends StatelessWidget {
  const RepoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoBloc, RepoState>(builder: (context, state) {
      if (state is RepoInitial) {
        return const Center(child: Text('Not loaded yet...'));
      }

      if (state is RepoLoading) {
        return const Center(child: CircularIndicator());
      }

      if (state is RepoLoaded) {
        return state.repos.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.builder(
                        itemCount: state.repos.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return RepoWidget(
                            repo: state.repos[index],
                          );
                        })))
            : const Center(child: Text('No data'));
      }

      if (state is RepoError) {
        return ErrorContainer(message: state.message);
      }

      return const Center(child: Text('Unknown state'));
    });
  }
}
