// import 'package:dartz/dartz.dart';
// import 'package:tellme_flutter/app/config/exception/exception.dart';
// import 'package:tellme_flutter/app/util/app_log_util.dart';
// import 'package:tellme_flutter/app/util/check_null_util.dart';
// import 'package:tellme_flutter/generated/l10n.dart';
// import 'package:injectable/injectable.dart';
// import 'package:url_launcher/url_launcher.dart';

// @lazySingleton
// class CallUtil {
//   Future callphone(String phoneNumber) async {
//     try {
//       final Uri? uri = Uri.tryParse('tel://$phoneNumber');
//       if (isNull(uri)) {
//         throw CommonException(message: S.current.cannot_make_call);
//       }

//       final bool canMakeCall = await canLaunchUrl(uri!);
//       if (!canMakeCall) {
//         throw CommonException(message: S.current.cannot_make_call);
//       }
//       await launchUrl(uri);
//       return const Right(null);
//     } catch (e, trace) {
//       AppLog.error('Call `callphone` ERROR', e, trace);
//       rethrow;
//     }
//   }
// }
