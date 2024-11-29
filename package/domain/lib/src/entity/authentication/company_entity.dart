import 'package:shared/shared.dart';

import '../base_entity.dart';
import 'address_entity.dart';

class CompanyEntity extends BaseEntity {
  final String department;
  final String name;
  final String title;
  final AddressEntity address;

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

  factory CompanyEntity.emptyObject() => CompanyEntity(
      department: EMPTY,
      name: EMPTY,
      title: EMPTY,
      address: AddressEntity.emptyObject());
}
