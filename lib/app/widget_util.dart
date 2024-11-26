import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/shared.dart';

import 'package:overlay_support/overlay_support.dart';

import 'routes_manager.dart';

OverlaySupportEntry? _loadingOverlayEntry;

enum StateRendererType {
  // POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS,
  // FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE, // THE UI OF THE SCREEN
  EMPTY_SCREEN_STATE // EMPTY VIEW WHEN WE RECEIVE NO DATA FROM API SIDE FOR LIST SCREEN
}

class WidgetUtil {
  void showGlobalLoadingOverlay() {
    dismissGlobalLoadingOverlay();
    _loadingOverlayEntry = showOverlay(
        (_, __) => const CircularProgressIndicator(),
        duration: const Duration(hours: 100));
  }

  void dismissGlobalLoadingOverlay() {
    _loadingOverlayEntry?.dismiss(animate: false);
  }

  void closeGlobalKeyboard({BuildContext? context}) {
    if (context != null) {
      FocusScope.of(context).unfocus();
      return;
    }
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
  }

  bool checkLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  bool checkKeyboardOpening(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0;

  Future<dynamic> showCenterDialog(
      {required BuildContext context,
      required Widget child,
      bool barrierDismissible = true}) {
    return showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
        useRootNavigator: true);
  }

  Future<dynamic> showFullScreenDialog(
      {required BuildContext context, required Widget child}) {
    return showDialog(
        context: context, builder: (_) => child, useRootNavigator: true);
  }

  bool hasPaddingBottom(BuildContext context) =>
      MediaQuery.of(context).padding.bottom != 0;

  double getPaddingBottom(BuildContext context) {
    if (hasPaddingBottom(context)) {
      return 32;
    }

    return 16;
  }

  void dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  bool _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  void showPopUp({
    required BuildContext context,
    StateRendererType stateRendererType =
        StateRendererType.FULL_SCREEN_LOADING_STATE,
    String title = EMPTY,
    String message = EMPTY,
    Function? retryActionFunction,
    bool barrierDismissible = true,
  }) {
    dismissDialog(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => _showStateWidget(
              stateRenderType: stateRendererType,
              message: message,
              title: title,
              retryActionFunction: retryActionFunction,
              context: context,
            )));
  }

  Widget _showStateWidget(
      {required StateRendererType stateRenderType,
      required BuildContext context,
      required String title,
      required String message,
      Function? retryActionFunction}) {
    switch (stateRenderType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context, retryActionFunction)
        ]);
      case StateRendererType.POPUP_SUCCESS:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context, retryActionFunction)
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(
              AppStrings.retry_again.tr(), context, retryActionFunction)
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Text(
          message,
          style:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget _getRetryButton(
      String buttonTitle, BuildContext context, Function? retryActionFunction) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              onPressed: () =>
                  retryActionFunction?.call() ?? Navigator.of(context).pop(),
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
