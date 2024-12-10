import 'package:dio/dio.dart';
import '../../constant/request_constants.dart';
import '../middleware/access_token_interceptor.dart';
import '../middleware/header_interceptor.dart';
import 'base/dio_builder.dart';
import 'base/rest_api_client.dart';

class RefreshTokenApiClient extends RestApiClient {
  RefreshTokenApiClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: RequestConstants.baseUrl),
            interceptors: [
              headerInterceptor,
              accessTokenInterceptor,
            ],
          ),
        );
}
