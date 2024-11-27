class SharedPreferenceKeys {
  const SharedPreferenceKeys._();

  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const currentUser = 'currentUser';
  static const isDarkMode = 'isDarkMode';
  static const deviceToken = 'deviceToken';
  static const isFirstLogin = 'isFirstLogin';
  static const isFirstLaunchApp = 'isFirstLaunchApp';
  static const languageCode = 'languageCode';

  static const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
  static const String PREFS_KEY_ONBOARDING_SCREEN =
      'PREFS_KEY_ONBOARDING  `SCREEN';
  static const String PREFS_KEY_IS_USER_LOGGED_IN =
      'PREFS_KEY_IS_USER_LOGGED_IN';
  static const String PREFS_KEY_TOKEN = 'PREFS_KEY_TOKEN';
  static const CACHE_HOME_KEY = 'CACHE_HOME_KEY';
  static const CACHE_HOME_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

  static const CACHE_STORE_DETAILS_KEY = 'CACHE_STORE_DETAILS_KEY';
  static const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis
}
