import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../domain/entity/model.dart';

Future<DeviceInfoEntity> getDeviceDetails() async {
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
    return DeviceInfoEntity(name, identifier, version);
  }
  return DeviceInfoEntity(name, identifier, version);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
