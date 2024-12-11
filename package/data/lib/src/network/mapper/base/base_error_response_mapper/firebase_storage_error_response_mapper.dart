import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

/// MODIFY IF NEEDED
class FirebaseStorageErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
      generalServerStatusCode: errorResponse?['error']['code'] as int?,
      generalMessage: errorResponse?['error']['message'] as String?,
    );
  }
}
