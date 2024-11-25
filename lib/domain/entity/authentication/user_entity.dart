import '../entity.dart';

class UserEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final String ip;
  final String macAddress;
  final String university;
  final String role;
  final String ein;
  final String ssn;
  final String userAgent;

  final CryptoEntity? crypto;
  final BankEntity? bank;
  final CompanyEntity? company;
  final HairEntity? hair;
  final AddressEntity? address;

  UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  UserEntity copyWith({
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
    HairEntity? hair,
    String? ip,
    AddressEntity? address,
    String? macAddress,
    String? university,
    BankEntity? bank,
    CompanyEntity? company,
    String? ein,
    String? ssn,
    String? userAgent,
    CryptoEntity? crypto,
    String? role,
  }) =>
      UserEntity(
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
}

class HairEntity {
  final String color;
  final String type;

  HairEntity({
    required this.color,
    required this.type,
  });

  HairEntity copyWith({
    String? color,
    String? type,
  }) =>
      HairEntity(
        color: color ?? this.color,
        type: type ?? this.type,
      );
}

class CryptoEntity {
  final String coin;
  final String wallet;
  final String network;

  CryptoEntity({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  CryptoEntity copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) =>
      CryptoEntity(
        coin: coin ?? this.coin,
        wallet: wallet ?? this.wallet,
        network: network ?? this.network,
      );
}
