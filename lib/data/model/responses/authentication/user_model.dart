// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

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
  final HairModel? hair;
  final String? ip;
  final AddressModel? address;
  final String? macAddress;
  final String? university;
  final BankModel? bank;
  final CompanyModel? company;
  final String? ein;
  final String? ssn;
  final String? userAgent;
  final CryptoModel? crypto;
  final String? role;

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

class BankModel {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  BankModel({
    this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban,
  });

  BankModel copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) =>
      BankModel(
        cardExpire: cardExpire ?? this.cardExpire,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        currency: currency ?? this.currency,
        iban: iban ?? this.iban,
      );

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban'],
      );

  Map<String, dynamic> toJson() => {
        'cardExpire': cardExpire,
        'cardNumber': cardNumber,
        'cardType': cardType,
        'currency': currency,
        'iban': iban,
      };
}

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

class CryptoModel {
  final String? coin;
  final String? wallet;
  final String? network;

  CryptoModel({
    this.coin,
    this.wallet,
    this.network,
  });

  CryptoModel copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) =>
      CryptoModel(
        coin: coin ?? this.coin,
        wallet: wallet ?? this.wallet,
        network: network ?? this.network,
      );

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        coin: json['coin'],
        wallet: json['wallet'],
        network: json['network'],
      );

  Map<String, dynamic> toJson() => {
        'coin': coin,
        'wallet': wallet,
        'network': network,
      };
}

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
