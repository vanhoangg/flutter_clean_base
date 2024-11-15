// import 'dart:convert';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:injectable/injectable.dart';
// import 'package:tellme_flutter/app/definition/strings.dart';
// import 'package:tellme_flutter/app/model/response/notification/notification_data.dart';
// import 'package:tellme_flutter/app/util/app_log_util.dart';
// import 'package:tellme_flutter/app/util/number_util.dart';
// import 'package:tellme_flutter/design_system/ds_theme.dart';

// final NotificationDetails _notificationDetails = NotificationDetails(
//     android: AndroidNotificationDetails(
//         PresentationNotification.androidNotificationChannelId,
//         PresentationNotification.androidNotificationChannelName,
//         channelDescription:
//             PresentationNotification.androidNotificationChannelDescription,
//         priority: Priority.high,
//         importance: Importance.high,
//         color: DSLightThemeData().systemGreen),
//     iOS: const DarwinNotificationDetails());

// // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //     FlutterLocalNotificationsPlugin();
// // const AndroidInitializationSettings initializationSettingsAndroid =
// //     AndroidInitializationSettings('app_icon');
// // final DarwinInitializationSettings initializationSettingsDarwin =
// //     DarwinInitializationSettings(
// //   requestSoundPermission: false,
// //   requestBadgePermission: false,
// //   requestAlertPermission: false,
// //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
// // );
// // final MacOSInitializationSettings initializationSettingsMacOS =
// //     MacOSInitializationSettings(
// //         requestAlertPermission: false,
// //         requestBadgePermission: false,
// //         requestSoundPermission: false);
// // final LinuxInitializationSettings initializationSettingsLinux =
// //   const LinuxInitializationSettings(
// //       defaultActionName: 'Open notification');
// // final InitializationSettings initializationSettings = InitializationSettings(
// //     android: initializationSettingsAndroid,
// //     iOS: initializationSettingsDarwin,
// //     macOS: initializationSettingsDarwin,
// //     linux: initializationSettingsLinux);
// // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
// //     onDidReceiveNotificationResponse = onDidReceiveNotificationResponse);

// abstract class NotificationUtil {
//   Future<bool?> init();
//   Future<void> show(NotificationData data);
//   void handle(NotificationData data);
//   Future<void> cancel(int id, {String? tag});
//   Future<void> cancelAll();
//   int get generateNotificationId;
// }

// @LazySingleton(as: NotificationUtil)
// class NotificationUtilImpl implements NotificationUtil {
//   NotificationUtilImpl(
//     this._plugin,
//     this._numberUtil,
//   );

//   final FlutterLocalNotificationsPlugin _plugin;
//   final NumberUtil _numberUtil;

//   String? lastMessageId;

//   final _hasInit = false;
//   bool get hasInit => _hasInit;

//   void _onTapNotificationHandler(String? payload) {
//     AppLog.info('Tap to the notification with payload: $payload');
//     // final NotificationData notificationData =
//     //     NotificationData.fromJson(json.decode(payload ?? '{}'));
//     // _deeplinkHandler.direct(notificationData.deeplink,
//     //     notificationId: notificationData.id);
//   }

//   @override
//   Future<bool?> init() {
//     const setting = InitializationSettings(
//       android: AndroidInitializationSettings('ic_notification'),
//       iOS: DarwinInitializationSettings(
//           requestAlertPermission: false,
//           requestCriticalPermission: false,
//           requestSoundPermission: false,
//           requestBadgePermission: false,
//           requestProvisionalPermission: false),
//     );

//     return _plugin.initialize(
//       setting,
//       onDidReceiveNotificationResponse: (details) {
//         _onTapNotificationHandler(details.payload);
//       },
//     );
//   }

//   @override
//   Future<void> show(NotificationData data) async {
//     // for (final item in blackList) {
//     //   if (data.deeplink.startsWith(item)) {
//     //     return;
//     //   }
//     // }
//     return _plugin.show(
//         generateNotificationId, data.title, data.body, _notificationDetails,
//         payload: json.encode(data.toJson()));
//   }

//   @override
//   void handle(NotificationData data) {
//     show(data);
//   }

//   @override
//   Future<void> cancel(int id, {String? tag}) => _plugin.cancel(id, tag: tag);

//   @override
//   Future<void> cancelAll() => _plugin.cancelAll();

//   @override
//   int get generateNotificationId => _numberUtil.randomInt(1000000);
// }
