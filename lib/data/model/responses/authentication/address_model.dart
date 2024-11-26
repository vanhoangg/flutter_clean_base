import 'authentication.dart';

class AddressModel {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final CoordinatesModel? coordinates;
  final String? country;

  AddressModel({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  AddressModel copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    CoordinatesModel? coordinates,
    String? country,
  }) =>
      AddressModel(
        address: address ?? this.address,
        city: city ?? this.city,
        state: state ?? this.state,
        stateCode: stateCode ?? this.stateCode,
        postalCode: postalCode ?? this.postalCode,
        coordinates: coordinates ?? this.coordinates,
        country: country ?? this.country,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json['address'],
        city: json['city'],
        state: json['state'],
        stateCode: json['stateCode'],
        postalCode: json['postalCode'],
        coordinates: json['coordinates'] == null
            ? null
            : CoordinatesModel.fromJson(json['coordinates']),
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'state': state,
        'stateCode': stateCode,
        'postalCode': postalCode,
        'coordinates': coordinates?.toJson(),
        'country': country,
      };
}
