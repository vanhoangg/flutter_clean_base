class DataListResponse<T> extends Object {
  final List<T>? items;
  final int? total;
  final int? skip;
  final int? limit;

  DataListResponse({
    this.items,
    this.total,
    this.skip,
    this.limit,
  });

  DataListResponse<T> copyWith({
    List<T>? items,
    int? total,
    int? skip,
    int? limit,
  }) =>
      DataListResponse(
        items: items ?? this.items,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory DataListResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    print('DataListResponse from key: ${T.toString()}');
    return DataListResponse(
      items: json[T.toString()] == null
          ? []
          : List<T>.from(json[T.toString()].map((x) => fromJsonT(x))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
        T.toString(): items == null
            ? []
            : List<dynamic>.from(items!.map((x) => toJsonT(x))),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
