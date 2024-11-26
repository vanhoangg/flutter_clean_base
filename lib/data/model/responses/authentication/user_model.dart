// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'authentication.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? maidenName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? birthDate;
  final String? image;
  final String? bloodGroup;
  final double? height;
  final double? weight;
  final String? eyeColor;

  final String? ip;
  final String? macAddress;
  final String? university;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final String? role;
  final AddressModel? address;
  final BankModel? bank;
  final CompanyModel? company;
  final HairModel? hair;
  final CryptoModel? crypto;

  UserModel({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.hair,
    this.ip,
    this.address,
    this.macAddress,
    this.university,
    this.bank,
    this.company,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  UserModel copyWith({
    String? accessToken,
    String? refreshToken,
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    HairModel? hair,
    String? ip,
    AddressModel? address,
    String? macAddress,
    String? university,
    BankModel? bank,
    CompanyModel? company,
    String? ein,
    String? ssn,
    String? userAgent,
    CryptoModel? crypto,
    String? role,
  }) =>
      UserModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        maidenName: maidenName ?? this.maidenName,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        password: password ?? this.password,
        birthDate: birthDate ?? this.birthDate,
        image: image ?? this.image,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        eyeColor: eyeColor ?? this.eyeColor,
        hair: hair ?? this.hair,
        ip: ip ?? this.ip,
        address: address ?? this.address,
        macAddress: macAddress ?? this.macAddress,
        university: university ?? this.university,
        bank: bank ?? this.bank,
        company: company ?? this.company,
        ein: ein ?? this.ein,
        ssn: ssn ?? this.ssn,
        userAgent: userAgent ?? this.userAgent,
        crypto: crypto ?? this.crypto,
        role: role ?? this.role,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        maidenName: json['maidenName'],
        age: json['age'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        username: json['username'],
        password: json['password'],
        birthDate: json['birthDate'],
        image: json['image'],
        bloodGroup: json['bloodGroup'],
        height: json['height']?.toDouble(),
        weight: json['weight']?.toDouble(),
        eyeColor: json['eyeColor'],
        hair: json['hair'] == null ? null : HairModel.fromJson(json['hair']),
        ip: json['ip'],
        address: json['address'] == null
            ? null
            : AddressModel.fromJson(json['address']),
        macAddress: json['macAddress'],
        university: json['university'],
        bank: json['bank'] == null ? null : BankModel.fromJson(json['bank']),
        company: json['company'] == null
            ? null
            : CompanyModel.fromJson(json['company']),
        ein: json['ein'],
        ssn: json['ssn'],
        userAgent: json['userAgent'],
        crypto: json['crypto'] == null
            ? null
            : CryptoModel.fromJson(json['crypto']),
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'maidenName': maidenName,
        'age': age,
        'gender': gender,
        'email': email,
        'phone': phone,
        'username': username,
        'password': password,
        'birthDate': birthDate,
        'image': image,
        'bloodGroup': bloodGroup,
        'height': height,
        'weight': weight,
        'eyeColor': eyeColor,
        'hair': hair?.toJson(),
        'ip': ip,
        'address': address?.toJson(),
        'macAddress': macAddress,
        'university': university,
        'bank': bank?.toJson(),
        'company': company?.toJson(),
        'ein': ein,
        'ssn': ssn,
        'userAgent': userAgent,
        'crypto': crypto?.toJson(),
        'role': role,
      };
}
