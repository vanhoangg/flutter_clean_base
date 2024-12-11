import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class GoongErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
      generalMessage: errorResponse?['error']['message'] as String?,
    );
  }
}
