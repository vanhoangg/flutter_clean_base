class CoordinatesModel {
  final double? lat;
  final double? lng;

  CoordinatesModel({
    this.lat,
    this.lng,
  });

  CoordinatesModel copyWith({
    double? lat,
    double? lng,
  }) =>
      CoordinatesModel(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      CoordinatesModel(
        lat: json['lat']?.toDouble(),
        lng: json['lng']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
