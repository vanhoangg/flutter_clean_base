import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class LineErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
        generalMessage: errorResponse?['error_description'] as String?);
  }
}
