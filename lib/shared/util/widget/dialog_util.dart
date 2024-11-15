// import 'package:flutter/material.dart';
// import 'package:tellme_flutter/design_system/ds_primary_button.dart';
// import 'package:tellme_flutter/design_system/ds_theme.dart';
// import 'package:tellme_flutter/generated/l10n.dart';

// class DialogUtil {
//   static Future<dynamic> showFullScreenDialog(
//     BuildContext context, {
//     required Widget widget,
//   }) async {
//     final result = showDialog<dynamic>(
//         context: context,
//         builder: (_) => Container(
//               color: Colors.black.withOpacity(0.75),
//               alignment: FractionalOffset.center,
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: widget,
//             ));

//     return result;
//   }

//   static Future<dynamic> showFullScreenDialogNoOffset(
//     BuildContext context, {
//     required Widget widget,
//     // Color color = Colors.black,
//   }) async {
//     final result = showDialog<dynamic>(
//         context: context,
//         anchorPoint: Offset.zero,
//         builder: (_) => SizedBox(
//               // color: color,
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: widget,
//             ));

//     return result;
//   }

//   static Future<dynamic> showQuitButtonDialog(
//     BuildContext context, {
//     required String title,
//     required String confirmText,
//     required VoidCallback onTapConfirm,
//   }) async {
//     final result = showDialog<dynamic>(
//       context: context,
//       builder: (_) {
//         return Dialog(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   title,
//                   style: DSTheme.of(context).style.tsQuick17w600.copyWith(
//                         color: DSTheme.of(context).color.black121212,
//                       ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 DSPrimaryButton(title: confirmText, onTap: onTapConfirm),
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: Navigator.of(context).pop,
//                   child: Text(
//                     S.of(context).quit.toString().toUpperCase(),
//                     style: DSTheme.of(context).style.tsQuick16w700.copyWith(
//                           color: DSTheme.of(context).color.black121212,
//                         ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     return result;
//   }
// }
