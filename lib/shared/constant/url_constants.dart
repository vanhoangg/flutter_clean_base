import 'package:flutter/material.dart';

import '../../flavors.dart';

class UrlConstants {
  const UrlConstants._();

  /// Url
  // static const termUrl = 'https://www.chatwork.com/';
  // static const lineApiBaseUrl = 'https://api.line.me/';
  // static const twitterApiBaseUrl = 'https://api.twitter.com/';
  // static const goongApiBaseUrl = 'https://rsapi.goong.io/';
  // static const firebaseStorageBaseUrl =
  //     'https://firebasestorage.googleapis.com/';
  // static const randomUserBaseUrl = 'https://randomuser.me/api/';

  // static const mockApiBaseUrl = 'https://api.jsonbin.io/';

  /// Path
  static const remoteConfigPath = '/config/RemoteConfig.json';
  static const settingsPath = '/mypage/settings';

  //* AUTHENTICATION
  static const authRoute = '/auth';
  static const registerRoute = '$authRoute/login';
  static const userDetailRoute = '$authRoute/me';
  static const refreshTokenRoute = '$authRoute/refresh';

  static String getMockImageURL({Size size = const Size(200, 200)}) {
    return 'https://picsum.photos/${size.width.toInt()}/${size.height.toInt()}';
  }

  static String get appApiBaseUrl {
    switch (F.appFlavor) {
      case Flavor.dev:
        return 'https://dummyjson.com';
      case Flavor.stg:
        return 'https://dummyjson.com';
      default:
        return 'https://dummyjson.com';
    }
  }
}
