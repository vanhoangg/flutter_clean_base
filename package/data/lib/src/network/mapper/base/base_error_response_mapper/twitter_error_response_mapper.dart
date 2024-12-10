import 'package:dartx/dartx.dart';

import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class TwitterErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? errorResponse) {
    return ServerError(
      generalMessage:
          // ignore: avoid-dynamic
          ((errorResponse?['errors'] as List<dynamic>?)?.firstOrNull
                  as Map<String, dynamic>)['message'] as String? ??
              '',
    );
  }
}
