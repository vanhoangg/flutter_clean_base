import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

/// MODIFY IF NEEDED
class FirebaseStorageErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(
      generalServerStatusCode: json?['error']['code'] as int?,
      generalMessage: json?['error']['message'] as String?,
    );
  }
}
