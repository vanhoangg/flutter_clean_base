class HairModel {
  final String? color;
  final String? type;

  HairModel({
    this.color,
    this.type,
  });

  HairModel copyWith({
    String? color,
    String? type,
  }) =>
      HairModel(
        color: color ?? this.color,
        type: type ?? this.type,
      );

  factory HairModel.fromJson(Map<String, dynamic> json) => HairModel(
        color: json['color'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'color': color,
        'type': type,
      };
}
