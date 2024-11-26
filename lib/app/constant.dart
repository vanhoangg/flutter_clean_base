import 'package:flutter/foundation.dart';

enum BlocStatus { inital, loading, success, failed }

class Constant {
  //#region Authentication
  static const bool developerMode = kDebugMode;
  static const String baseUrl = 'https://dummyjson.com/';
  static const String authPath = 'auth';
  static const String userIdParams = 'userId';
  static const String todoIdParams = 'todoId';

  static const String keyParams = 'key';
  static const String valueParams = 'value';
  static const String searchParams = 'q';
  static const String loginPath = '${authPath}/login';
  static const String userPath = '${authPath}/users';
  static const String searchUserPath = '${userPath}/search';
  static const String filterUserPath = '${userPath}/filter';
  static const String userDetailPath = '$userPath/{${userIdParams}}';

  static const String userListCartsPath = '${userPath}/{${userIdParams}}/carts';
  static const String userListTodosPath = '${userPath}/{${userIdParams}}/todos';
  static const String userListPostsPath = '${userPath}/{${userIdParams}}/posts';

  static const String todoDetailPath = '${userPath}/todos/{${todoIdParams}}';

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
