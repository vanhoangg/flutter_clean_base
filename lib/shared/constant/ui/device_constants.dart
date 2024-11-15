import 'package:flutter/foundation.dart';

class DeviceConstants {
  const DeviceConstants._();

  static const designDeviceWidth = 375.0;
  static const designDeviceHeight = 667.0;

  static const maxMobileWidth = 600;
  static const maxTabletWidth = 900;

  static const maxMobileWidthForDeviceType = 550;
}

class PlatformDetector {
  static final PlatformDetector _instance = PlatformDetector._internal();

  factory PlatformDetector() => _instance;

  PlatformDetector._internal();

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isWeb => kIsWeb;
  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;
  bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;
  bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;
}
