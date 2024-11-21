class Constant {
  //#region Authentication
  static const String baseUrl = 'https://dummyjson.com/';
  static const String authPath = 'auth';
  static const String loginPath = '${authPath}/login';
  static const String userPath = '${authPath}/user';

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
