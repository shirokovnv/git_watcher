import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_watcher/bloc/trends/users/trend_user_bloc.dart';
import 'package:git_watcher/ui/screens/trends/widgets/user_widget.dart';
import 'package:git_watcher/ui/shared/widgets/circular_indicator.dart';
import 'package:git_watcher/ui/shared/widgets/error_container.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendUserBloc, TrendUserState>(
        builder: (context, state) {
      if (state is TrendUserInitial) {
        BlocProvider.of<TrendUserBloc>(context).add(FetchTrendUserEvent());
      }

      if (state is TrendUserLoading) {
        return const Center(child: CircularIndicator());
      }

      if (state is TrendUserLoaded) {
        return state.users.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.builder(
                        itemCount: state.users.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return UserWidget(user: state.users[index]);
                        })))
            : const Center(child: Text('No data'));
      }

      if (state is TrendUserError) {
        return ErrorContainer(message: state.message);
      }

      return const Center(child: Text('Unknown state'));
    });
  }
}
