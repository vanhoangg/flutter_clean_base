class RequestConstants {
  const RequestConstants._();

  // Base URL
  static const String baseUrl = 'https://dummyjson.com/';
  //#endregion

  //#region Movie
  static const String baseMovieUrl = 'http://www.omdbapi.com/';
  static const String movieToken = '789a0dca';
  //#endregion

  // - Header
  static const basicAuthorization = 'Authorization';
  static const jwtAuthorization = 'JWT-Authorization';
  static const userAgentKey = 'User-Agent';
  static const bearer = 'Bearer';
  static const String applicationJson = 'application/json';
  static const String contentType = 'content-type';
  static const String accept = 'accept';
  static const String DEFAULT_LANGUAGE = 'language';

  /// language code
  static const en = 'EN';
  static const ja = 'JA';

  /// gender
  static const male = 0;
  static const female = 1;
  static const other = 2;
  static const unknown = -1;
  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);
  static int maxRetries = 3;
  static Duration retryInterval = const Duration(seconds: 3);
}
