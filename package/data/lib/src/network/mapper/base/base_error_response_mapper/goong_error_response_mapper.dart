import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class GoongErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(
      generalMessage: json?['error']['message'] as String?,
    );
  }
}
