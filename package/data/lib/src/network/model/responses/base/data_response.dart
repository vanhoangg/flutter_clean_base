class DataResponse<T> {
  final T? data;

  DataResponse({
    this.data,
  });

  DataResponse<T> copyWith({
    T? data,
  }) =>
      DataResponse(
        data: data ?? this.data,
      );

  factory DataResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    print('DataResponse from key: ${T.toString()}');

    return DataResponse(
      data: json[T.toString()] == null ? null : fromJsonT(json[T.toString()]),
    );
  }

  Map<String, dynamic> toJson(
          Map<String, dynamic> Function(T) toJsonT, String keyJsonT) =>
      {
        keyJsonT: data == null ? '' : toJsonT(data as T),
      };
}
