part of 'follower_bloc.dart';

sealed class FollowerEvent extends Equatable {
  const FollowerEvent();

  @override
  List<Object> get props => [];
}

final class FetchFollowersEvent extends FollowerEvent {
  final String userName;
  final FollowerType followerType;

  const FetchFollowersEvent(
      {required this.userName, required this.followerType});

  @override
  List<Object> get props => [userName, followerType];
}
