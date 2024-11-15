class ServerErrorDetail {
  final String? detail;
  final String? path;

  /// server-defined error code
  final String? serverErrorId;

  /// server-defined status code
  final int? serverStatusCode;

  /// server-defined message
  final String? message;

  /// server-defined field
  final String? field;

  const ServerErrorDetail(
      {this.detail,
      this.path,
      this.serverErrorId,
      this.serverStatusCode,
      this.message,
      this.field});
}
