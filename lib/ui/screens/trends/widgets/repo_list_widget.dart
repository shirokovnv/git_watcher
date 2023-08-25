import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/trends/repos/trend_repo_bloc.dart';
import 'package:git_watcher/ui/screens/trends/widgets/repo_widget.dart';
import 'package:git_watcher/ui/shared/widgets/circular_indicator.dart';

class RepoListWidget extends StatelessWidget {
  const RepoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendRepoBloc, TrendRepoState>(
        builder: (context, state) {
      if (state is TrendRepoInitial) {
        BlocProvider.of<TrendRepoBloc>(context)
            .add(const FetchTrendRepoEvent());
      }

      if (state is TrendRepoLoading) {
        return const Center(child: CircularIndicator());
      }

      if (state is TrendRepoLoaded) {
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

      return const Center(child: Text('Unknown state'));
    });
  }
}
