part of 'store_details_bloc.dart';

sealed class StoreDetailsState extends Equatable {
  const StoreDetailsState();

  @override
  List<Object> get props => [];
}

class StoreDetailsInitial extends StoreDetailsState {
  @override
  List<Object> get props => super.props;
}

class StoreDetailsLoading extends StoreDetailsState {
  @override
  List<Object> get props => super.props;
}

class StoreDetailsFinish extends StoreDetailsState {
  const StoreDetailsFinish({
    this.data,
  });

  final StoreDetailsEntity? data;

  @override
  List<Object> get props => [data ?? StoreDetailsEntity.empty()];
}
