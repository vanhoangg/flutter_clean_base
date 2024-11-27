import 'server_error_detail.dart';

class ServerError {
  int? generalServerStatusCode;

  /// server-defined error id
  String? generalServerErrorId;

  /// server-defined message
  String? generalMessage;
  List<ServerErrorDetail> errors;
  ServerError({
    this.generalMessage,
    this.generalServerErrorId,
    this.generalServerStatusCode,
    this.errors = ServerError.defaultErrors,
  });
  static const defaultGeneralServerStatusCode = -1;
  static const defaultGeneralServerErrorId = '';
  static const defaultGeneralMessage = '';
  static const defaultErrors = <ServerErrorDetail>[];
}
