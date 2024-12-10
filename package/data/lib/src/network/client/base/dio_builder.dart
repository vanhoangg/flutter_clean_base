import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import '../../../constant/request_constants.dart';
import '../../middleware/base_interceptor.dart';
import 'api_client_default_settings.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout:
            options?.connectTimeout ?? RequestConstants.connectTimeout,
        receiveTimeout:
            options?.receiveTimeout ?? RequestConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? RequestConstants.sendTimeout,
        baseUrl: options?.baseUrl ?? RequestConstants.baseUrl,
      ),
    );

    final sortedInterceptors = [
      ...ApiClientDefaultSetting.requiredInterceptors(dio),
      ...interceptors,
    ].sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });

    dio.interceptors.addAll(sortedInterceptors);

    return dio;
  }
}
