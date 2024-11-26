class ListPaginationModel<T> {
  final List<T>? items;
  final int? total;
  final int? skip;
  final int? limit;

  ListPaginationModel({
    this.items,
    this.total,
    this.skip,
    this.limit,
  });

  ListPaginationModel<T> copyWith({
    List<T>? items,
    int? total,
    int? skip,
    int? limit,
  }) =>
      ListPaginationModel(
        items: items ?? this.items,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  factory ListPaginationModel.fromJson(Map<String, dynamic> json,
          String keyOfList, T Function(Map<String, dynamic>) fromJsonT) =>
      ListPaginationModel(
        items: json[keyOfList] == null
            ? []
            : List<T>.from(json[keyOfList].map((x) => fromJsonT(x))),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson(
          Map<String, dynamic> Function(T) toJsonT, String keyJsonT) =>
      {
        keyJsonT: items == null
            ? []
            : List<dynamic>.from(items!.map((x) => toJsonT(x))),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
