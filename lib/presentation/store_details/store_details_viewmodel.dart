import 'dart:ffi';

import 'package:rxdart/rxdart.dart';

import '../../domain/model/model.dart';
import '../../domain/usecase/store_details_usecase.dart';
import '../base/baseviewmodel.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../common/state_renderer/state_renderer.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInput, StoreDetailsViewModelOutput {
  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  final StoreDetailsUseCase storeDetailsUseCase;

  StoreDetailsViewModel(this.storeDetailsUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await storeDetailsUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
      },
      (storeDetails) async {
        inputState.add(ContentState());
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
  }

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  //output
  @override
  Stream<StoreDetails> get outputStoreDetails =>
      _storeDetailsStreamController.stream.map((stores) => stores);
}

abstract class StoreDetailsViewModelInput {
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutput {
  Stream<StoreDetails> get outputStoreDetails;
}
