import 'package:shared/shared.dart';

import '../base_entity.dart';

class CoordinatesEntity extends BaseEntity {
  final double lat;
  final double lng;

  CoordinatesEntity({
    required this.lat,
    required this.lng,
  });

  @override
  CoordinatesEntity copyWith({
    double? lat,
    double? lng,
  }) =>
      CoordinatesEntity(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory CoordinatesEntity.emptyObject() {
    return CoordinatesEntity(
      lat: ZERO.toDouble(),
      lng: ZERO.toDouble(),
    );
  }
}
