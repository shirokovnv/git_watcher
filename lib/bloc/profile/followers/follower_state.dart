part of 'follower_bloc.dart';

sealed class FollowerState extends Equatable {
  const FollowerState();

  @override
  List<Object> get props => [];
}

final class FollowerInitial extends FollowerState {}

final class FollowersLoading extends FollowerState {}

final class FollowersLoaded extends FollowerState {
  final List<User> followers;
  final FollowerType followerType;

  const FollowersLoaded({required this.followers, required this.followerType});

  @override
  List<Object> get props => [followers, followerType];
}
