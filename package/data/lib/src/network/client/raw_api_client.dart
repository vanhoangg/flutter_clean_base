import 'package:dio/dio.dart';

import 'base/dio_builder.dart';
import 'base/rest_api_client.dart';

class RawApiClient extends RestApiClient {
  RawApiClient()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: ''),
          ),
        );
}
