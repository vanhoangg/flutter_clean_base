part of 'store_details_bloc.dart';

sealed class StoreDetailsEvent extends Equatable {
  const StoreDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchDataStoreDetailEvent extends StoreDetailsEvent {
  const FetchDataStoreDetailEvent();
  @override
  List<Object> get props => super.props;
}
