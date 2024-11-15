import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/store_details_entity.dart';
import '../../../domain/usecase/store_details_usecase.dart';

part 'store_details_event.dart';
part 'store_details_state.dart';

class StoreDetailsBloc extends Bloc<StoreDetailsEvent, StoreDetailsState> {
  StoreDetailsBloc(this._storeDetailsUseCase) : super(StoreDetailsInitial()) {
    on<StoreDetailsEvent>((event, emit) {});
    on<FetchDataStoreDetailEvent>(_onFetchDataStoreDetail);
  }

  final StoreDetailsUseCase _storeDetailsUseCase;

  FutureOr<void> _onFetchDataStoreDetail(
      FetchDataStoreDetailEvent event, Emitter<StoreDetailsState> emit) async {
    emit(StoreDetailsLoading());
    StoreDetailsEntity? data;
    final result =
        await _storeDetailsUseCase.execute(const StoreDetailsUseCaseInput());
    result.fold((l) => null, (r) {
      data = r;
    });
    emit(StoreDetailsFinish(data: data));
  }
}
