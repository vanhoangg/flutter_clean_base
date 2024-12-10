import 'package:dio/dio.dart';

import '../../constant/request_constants.dart';
import '../middleware/access_token_interceptor.dart';
import '../middleware/header_interceptor.dart';
import 'base/dio_builder.dart';
import 'base/rest_api_client.dart';

class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
    // TODO(Hoang): Implement if need refresh token
    // RefreshTokenInterceptor refreshTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: RequestConstants.baseUrl),
            interceptors: [
              headerInterceptor,
              accessTokenInterceptor,
              // refreshTokenInterceptor,
            ],
          ),
        );
}
