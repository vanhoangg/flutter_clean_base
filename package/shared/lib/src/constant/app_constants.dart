import 'package:flutter/foundation.dart';

class AppConstant {
  //#region Authentication
  static const bool developerMode = kDebugMode;
  static const String baseUrl = 'https://dummyjson.com/';
  static const String token = 'get api token here';
  //#endregion

  //#region Movie
  static const String baseMovieUrl = 'http://www.omdbapi.com/';
  static const String movieToken = '789a0dca';
  //#endregion

  static const String defaultTitleEmtpy = 'Title';
  static const String defaultTextEmtpy = 'Text';
  static const String defaultStringEmtpy = '';
}
