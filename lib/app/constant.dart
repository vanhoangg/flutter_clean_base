import 'package:flutter/foundation.dart';

enum BlocStatus { inital, loading, success, failed }

class Constant {
  //#region Authentication
  static const bool developerMode = kDebugMode;
  static const String baseUrl = 'https://dummyjson.com/';
  static const String authPath = 'auth';

  static const String loginPath = '${authPath}/login';
  static const String userPath = '${authPath}/users';

  static const String todos = 'todos';
  static const String carts = 'cart';

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
