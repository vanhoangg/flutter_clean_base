import 'authentication.dart';

class CompanyModel {
  final String? department;
  final String? name;
  final String? title;
  final AddressModel? address;

  CompanyModel({
    this.department,
    this.name,
    this.title,
    this.address,
  });

  CompanyModel copyWith({
    String? department,
    String? name,
    String? title,
    AddressModel? address,
  }) =>
      CompanyModel(
        department: department ?? this.department,
        name: name ?? this.name,
        title: title ?? this.title,
        address: address ?? this.address,
      );

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        department: json['department'],
        name: json['name'],
        title: json['title'],
        address: json['address'] == null
            ? null
            : AddressModel.fromJson(json['address']),
      );

  Map<String, dynamic> toJson() => {
        'department': department,
        'name': name,
        'title': title,
        'address': address?.toJson(),
      };
}
