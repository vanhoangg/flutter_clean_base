import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/di.dart';

import '../../domain/entity/store_details_entity.dart';
import '../../shared/shared.dart';
import '../base/base_state.dart';

import 'bloc/store_details_bloc.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({super.key});

  @override
  _StoreDetailsViewState createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends BaseState<StoreDetailsView> {
  final StoreDetailsBloc _bloc = instance<StoreDetailsBloc>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  void bind() {
    _bloc.add(const FetchDataStoreDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StoreDetailsBloc, StoreDetailsState>(
        builder: (context, state) {
          if (state is StoreDetailsLoading) {
            widgetUtil.showGlobalLoadingOverlay();
          }
          if (state is StoreDetailsFinish) {
            widgetUtil.dismissGlobalLoadingOverlay();
            return _getContentWidget(state.data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _getContentWidget(StoreDetailsEntity? storeDetails) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: Text(AppStrings.storeDetails.tr()),
          elevation: AppSize.s0,
          iconTheme: IconThemeData(
            //back button
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primary,
          centerTitle: true,
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: ColorManager.white,
          child: SingleChildScrollView(
            child: _getItems(storeDetails),
          ),
        ));
  }

  Widget _getItems(StoreDetailsEntity? storeDetails) {
    if (storeDetails != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
            storeDetails.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          )),
          _getSection(AppStrings.details.tr()),
          _getInfoText(storeDetails.details),
          _getSection(AppStrings.services.tr()),
          _getInfoText(storeDetails.services),
          _getSection(AppStrings.about.tr()),
          _getInfoText(storeDetails.about)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _getSection(String title) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p12,
            right: AppPadding.p12,
            bottom: AppPadding.p2),
        child: Text(title, style: Theme.of(context).textTheme.displaySmall));
  }

  Widget _getInfoText(String info) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Text(info, style: Theme.of(context).textTheme.bodyMedium),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
