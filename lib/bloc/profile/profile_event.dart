part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends ProfileEvent {
  final String userName;

  const FetchUserEvent({required this.userName});

  @override
  List<Object> get props => [userName];
}
