import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_watcher/data/interfaces/trends_interface.dart';
import 'package:git_watcher/data/models/user.dart';

part 'trend_user_event.dart';
part 'trend_user_state.dart';

class TrendUserBloc extends Bloc<TrendUserEvent, TrendUserState> {
  final TrendsInterface _trends;

  TrendUserBloc({required TrendsInterface trends})
      : _trends = trends,
        super(TrendUserInitial()) {
    on<FetchTrendUserEvent>(_onFetchTrendUser);
  }

  _onFetchTrendUser(
      FetchTrendUserEvent event, Emitter<TrendUserState> emit) async {
    emit(TrendUserLoading());
    List<User> users = await _trends.fetchDevelopers();
    emit(TrendUserLoaded(users: users));
  }
}
