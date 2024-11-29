import '../app_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared/shared.dart';

import '../constant/request_constants.dart';

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    final Dio dio = Dio();
    const Duration timeOut = Duration(minutes: 60 * 1000);
// 1 min
    final String language = await _appPreferences.getAppLanguage();
    final String token = await _appPreferences.getUserToken();
    final Map<String, String> headers = {
      RequestConstants.contentType: RequestConstants.applicationJson,
      RequestConstants.accept: RequestConstants.applicationJson,
      RequestConstants.basicAuthorization: token,
      RequestConstants.DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        baseUrl: AppConstant.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);

    if (kReleaseMode) {
      print('release mode no logs');
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
