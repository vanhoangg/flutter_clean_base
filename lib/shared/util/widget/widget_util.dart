import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';

import '../../shared.dart';
import '../resources/resources.dart';

OverlaySupportEntry? _loadingOverlayEntry;

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

//   static void showConfirmDialog(
//       {required BuildContext context,
//       required String message,
//       required String btnTitleConfirm,
//       required VoidCallback onConfirm,
//       required String btnTitleCancel,
//       required bool barrierDismissible,
//       bool autoDismiss = false,
//       VoidCallback? onCancel}) {
//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 message,
//                 style: DSTheme.of(context).style.tsQuick17w600.copyWith(
//                       color: DSTheme.of(context).color.black121212,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 46,
//                 child: DSPrimaryButton(
//                   title: btnTitleConfirm,
//                   onTap: () {
//                     if (autoDismiss) {
//                       Navigator.of(context).pop();
//                     }
//                     onConfirm.call();
//                   },
//                 ),
//               ),
//               const SizedBox(height: 15),
//               SizedBox(
//                 height: 46,
//                 child: DSPrimaryButton(
//                   title: btnTitleCancel,
//                   bgColor: DSTheme.of(context).color.black121212,
//                   onTap: onCancel ?? () => Navigator.of(context).pop(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       barrierDismissible: barrierDismissible,
//     );
//   }

//   void showMessageDialog(
//       {required BuildContext? context,
//       required String message,
//       required String btnTitleCancel,
//       required bool barrierDismissible,
//       VoidCallback? onCancel}) {
//     showDialog(
//       context: context ?? navigatorState.context,
//       builder: (ctx) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 message,
//                 style: DSTheme.of(context ?? navigatorState.context)
//                     .style
//                     .tsQuick17w600
//                     .copyWith(
//                       color: DSTheme.of(context ?? navigatorState.context)
//                           .color
//                           .black121212,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 46,
//                 child: DSPrimaryButton(
//                   title: btnTitleCancel,
//                   bgColor: DSTheme.of(context ?? navigatorState.context)
//                       .color
//                       .black121212,
//                   onTap: onCancel ??
//                       () =>
//                           Navigator.of(context ?? navigatorState.context).pop(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       barrierDismissible: barrierDismissible,
//     );
//   }

//   static void showMessageDialogGlobally(
//       {required String message,
//       required String btnTitleCancel,
//       required bool barrierDismissible,
//       VoidCallback? onCancel}) {
//     showDialog(
//       context: navigatorState.context,
//       builder: (ctx) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 message,
//                 style: DSTheme.of(navigatorState.context)
//                     .style
//                     .tsQuick17w600
//                     .copyWith(
//                       color:
//                           DSTheme.of(navigatorState.context).color.black121212,
//                     ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: 46,
//                 child: DSPrimaryButton(
//                   title: btnTitleCancel,
//                   bgColor: DSTheme.of(navigatorState.context).color.black121212,
//                   onTap: onCancel ??
//                       () => Navigator.of(navigatorState.context).pop(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       barrierDismissible: barrierDismissible,
//     );
//   }

//   static void showRetryDialog({
//     required BuildContext context,
//     required String message,
//     required VoidCallback onRetry,
//     required bool barrierDismissible,
//     VoidCallback? onCancel,
//   }) {
//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           content: DSErrorIndicator(
//             message: message,
//             onRetry: onRetry,
//             onCancel: onCancel,
//           ),
//         );
//       },
//       barrierDismissible: barrierDismissible,
//     );
//   }

//   void showNotificationDialog(
//       {required BuildContext context,
//       required String message,
//       required String btnTitleCancel,
//       required bool barrierDismissible,
//       VoidCallback? onCancel}) {
//     if (navigatorKey.currentState?.context != null) {
//       showDialog(
//         context: navigatorKey.currentState!.context,
//         builder: (ctx) {
//           return AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   message,
//                   style: DSTheme.of(ctx).style.tsQuick17w600.copyWith(
//                         color: DSTheme.of(ctx).color.black121212,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   height: 44,
//                   child: DSPrimaryButton(
//                     title: btnTitleCancel,
//                     bgColor: DSTheme.of(ctx).color.black121212,
//                     onTap: onCancel ??
//                         () => Navigator.of(ctx, rootNavigator: true).pop(),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         barrierDismissible: barrierDismissible,
//       );
//     }
//   }
}
