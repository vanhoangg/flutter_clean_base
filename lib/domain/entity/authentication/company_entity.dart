import '../../../app/extensions.dart';
import '../base_entity.dart';
import '../entity.dart';

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

  @override
  factory CoordinatesEntity.defaultInstance() {
    return CoordinatesEntity(
      lat: ZERO.toDouble(),
      lng: ZERO.toDouble(),
    );
  }
}

class CompanyEntity extends BaseEntity {
  final String department;
  final String name;
  final String title;
  final AddressEntity? address;

  CompanyEntity({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  @override
  CompanyEntity copyWith({
    String? department,
    String? name,
    String? title,
    AddressEntity? address,
  }) =>
      CompanyEntity(
        department: department ?? this.department,
        name: name ?? this.name,
        title: title ?? this.title,
        address: address ?? this.address,
      );
}
