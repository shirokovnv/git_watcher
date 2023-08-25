part of 'trend_user_bloc.dart';

sealed class TrendUserState extends Equatable {
  const TrendUserState();

  @override
  List<Object> get props => [];
}

final class TrendUserInitial extends TrendUserState {}

final class TrendUserLoading extends TrendUserState {}

final class TrendUserLoaded extends TrendUserState {
  final List<User> users;

  const TrendUserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}
