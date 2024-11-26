import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    final String? language =
        _sharedPreferences.getString(SharedPreferenceKeys.PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguageChanged() async {
    final String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.VIETNAMESE.getValue()) {
      // save prefs with english lang
      await _sharedPreferences.setString(
          SharedPreferenceKeys.PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // save prefs with VIETNAMESE lang
      await _sharedPreferences.setString(SharedPreferenceKeys.PREFS_KEY_LANG,
          LanguageType.VIETNAMESE.getValue());
    }
  }

  Future<Locale> getLocal() async {
    final String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.VIETNAMESE.getValue()) {
      // return arabic local
      return VIETNAMESE_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(
        SharedPreferenceKeys.PREFS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences
            .getBool(SharedPreferenceKeys.PREFS_KEY_ONBOARDING_SCREEN) ??
        false;
  }

  Future<void> setUserToken(String token) async {
    await _sharedPreferences.setString(
        SharedPreferenceKeys.PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(SharedPreferenceKeys.PREFS_KEY_TOKEN) ??
        '';
  }

  Future<void> setIsUserLoggedIn() async {
    await _sharedPreferences.setBool(
        SharedPreferenceKeys.PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences
            .getBool(SharedPreferenceKeys.PREFS_KEY_IS_USER_LOGGED_IN) ??
        false;
  }

  Future<void> logout() async {
    await _sharedPreferences
        .remove(SharedPreferenceKeys.PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
