import 'package:dio/dio.dart';

import '../../constant/request_constants.dart';
import '../middleware/header_interceptor.dart';
import 'base/dio_builder.dart';
import 'base/rest_api_client.dart';

class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(HeaderInterceptor headerInterceptor)
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: RequestConstants.baseUrl),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
