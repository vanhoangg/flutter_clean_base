import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef DeviceInfo = ({String name, String identifier, String version});
Future<DeviceInfo> getDeviceDetails() async {
  String name = 'Unknown';
  String identifier = 'Unknown';
  String version = 'Unknown';

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android device info
      final build = await deviceInfoPlugin.androidInfo;
      name = '${build.brand} ${build.model}';
      identifier = build.id;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      // return ios device info
      final build = await deviceInfoPlugin.iosInfo;
      name = '${build.name} ${build.model}';
      identifier = build.identifierForVendor ?? identifier;
      version = build.systemVersion;
    }
  } on PlatformException {
    // return default data here
    return (name: name, identifier: identifier, version: version);
  }
  return (name: name, identifier: identifier, version: version);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

void printMediaQueryProperties(BuildContext context, {bool verbose = true}) {
  final mediaQuery = MediaQuery.of(context);

  log('--- MediaQuery Properties ---');
  log('Size: ${mediaQuery.size}'); // Screen dimensions
  log('Orientation: ${mediaQuery.orientation}'); // Portrait or Landscape
  log('Device Pixel Ratio: ${mediaQuery.devicePixelRatio}'); // Pixels per logical inch
  log('Text Scale Factor: ${mediaQuery.textScaleFactor}'); // User font scaling

  if (verbose) {
    log('Platform Brightness: ${mediaQuery.platformBrightness}'); // Light or Dark
    log('Padding: ${mediaQuery.padding}'); // Safe area padding
    log('View Padding: ${mediaQuery.viewPadding}'); // View's padding, including notches
    log('View Insets: ${mediaQuery.viewInsets}'); // Overlapping UI inset
    log('System Gesture Insets: ${mediaQuery.systemGestureInsets}'); // Gesture areas
    log('Always Use 24 Hour Format: ${mediaQuery.alwaysUse24HourFormat}');
    log('Accessible Navigation: ${mediaQuery.accessibleNavigation}');
    log('Invert Colors: ${mediaQuery.invertColors}');
    log('High Contrast: ${mediaQuery.highContrast}');
    log('Disable Animations: ${mediaQuery.disableAnimations}');
    log('Bold Text: ${mediaQuery.boldText}');
    log('Gesture Settings: ${mediaQuery.gestureSettings}');
  }
  log('--- End of MediaQuery Properties ---');
  log('--- NEW MediaQuery Properties ---');
  log('viewInsetsOf: ${MediaQuery.viewInsetsOf(context)}'); // viewInsetsOf
  log('viewPaddingOf: ${MediaQuery.viewPaddingOf(context)}'); // User font scaling
  log('paddingOf: ${MediaQuery.paddingOf(context)}'); // User font scaling
  log('maybePaddingOf: ${MediaQuery.maybePaddingOf(context)}'); // User font scaling
  log('maybeViewPaddingOf: ${MediaQuery.maybeViewPaddingOf(context)}'); // User font scaling
  log('maybeViewInsetsOf: ${MediaQuery.maybeViewInsetsOf(context)}'); // User font scaling
  log('--- End of NEW MediaQuery Properties ---');
}
