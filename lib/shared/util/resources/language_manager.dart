import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, VIETNAMESE }

const String VIETNAMESE = 'vi';
const String ENGLISH = 'en';
const String ASSETS_PATH_LOCALISATIONS = 'assets/translations';
const Locale ARABIC_LOCAL = Locale(VIETNAMESE, 'VN');
const Locale ENGLISH_LOCAL = Locale(ENGLISH, 'US');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.VIETNAMESE:
        return VIETNAMESE;
    }
  }
}
