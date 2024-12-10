import 'package:shared/shared.dart';

import '../base_error_response_mapper.dart';

class JsonArrayErrorResponseMapper
    extends BaseErrorResponseMapper<List<dynamic>> {
  @override
  // ignore: avoid-dynamic
  ServerError mapToServerError(List<dynamic>? errorResponse) {
    return ServerError(
      errors: errorResponse
              ?.map((jsonObject) => ServerErrorDetail(
                    serverStatusCode: jsonObject['code'] as int?,
                    message: jsonObject['message'] as String?,
                  ))
              .toList(growable: false) ??
          [],
    );
  }
}
