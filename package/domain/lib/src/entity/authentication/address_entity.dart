import '../base_entity.dart';
import '../entity.dart';

class AddressEntity extends BaseEntity {
  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final CoordinatesEntity? coordinates;
  final String country;

  AddressEntity({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  @override
  AddressEntity copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    CoordinatesEntity? coordinates,
    String? country,
  }) =>
      AddressEntity(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        stateCode: stateCode ?? this.stateCode,
        postalCode: postalCode ?? this.postalCode,
        coordinates: coordinates ?? this.coordinates,
        country: country ?? this.country,
      );
}
