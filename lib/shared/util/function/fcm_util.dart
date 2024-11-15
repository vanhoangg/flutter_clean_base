// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class FCMUtil {
//   /// Returns a Stream that is called when an incoming FCM payload is received whilst
//   /// the Flutter instance is in the foreground.
//   Stream<RemoteMessage> onMessage() => FirebaseMessaging.onMessage;

//   /// Returns a [Stream] that is called when a user presses a notification message displayed
//   /// via FCM.
//   ///
//   /// A Stream event will be sent if the app has opened from a background state
//   /// (not terminated).
//   ///
//   /// If your app is opened via a notification whilst the app is terminated,
//   /// see [getInitialMessage].
//   Stream<RemoteMessage> onMessageOpenedApp() =>
//       FirebaseMessaging.onMessageOpenedApp;

//   /// If the application has been opened from a terminated state via a [RemoteMessage]
//   /// (containing a [Notification]), it will be returned, otherwise it will be `null`.
//   ///
//   /// Once the [RemoteMesage] has been consumed, it will be removed and further
//   /// calls to [getInitialMessage] will be `null`.
//   ///
//   /// This should be used to determine whether specific notification interaction
//   /// should open the app with a specific purpose (e.g. opening a chat message,
//   /// specific screen etc).
//   Future<RemoteMessage?> getInitialMessage() =>
//       FirebaseMessaging.instance.getInitialMessage();

//   Future<NotificationSettings> requestNotificationPermission() =>
//       FirebaseMessaging.instance.requestPermission(
//         alert: true,
//         badge: true,
//         provisional: false,
//         sound: true,
//       );

//   Future<String?> getToken() => FirebaseMessaging.instance.getToken();

//   Future<void> deleteToken() => FirebaseMessaging.instance.deleteToken();
// }
