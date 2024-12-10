import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
      generalServerStatusCode: errorResponse?['error']?['status_code'] as int?,
      generalServerErrorId: errorResponse?['error']?['error_code'] as String?,
      generalMessage: errorResponse?['error']?['message'] as String?,
    );
  }
}
