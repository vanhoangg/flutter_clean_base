import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.init()) {
    on<FetchHomeDataEvent>(_onFetchHomeDataEvent);
  }

  FutureOr<void> _onFetchHomeDataEvent(
      FetchHomeDataEvent event, Emitter<HomeState> emit) {}
}
