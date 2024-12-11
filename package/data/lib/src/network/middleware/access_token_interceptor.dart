import 'package:dio/dio.dart';

import '../../../../../data.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _appPreferences.getUserToken();
    if (token.isNotEmpty) {
      options.headers[RequestConstants.basicAuthorization] =
          '${RequestConstants.bearer} $token';
    }

    handler.next(options);
  }
}
