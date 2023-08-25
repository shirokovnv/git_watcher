part of 'trend_user_bloc.dart';

sealed class TrendUserEvent extends Equatable {
  const TrendUserEvent();

  @override
  List<Object> get props => [];
}

final class FetchTrendUserEvent extends TrendUserEvent {}
