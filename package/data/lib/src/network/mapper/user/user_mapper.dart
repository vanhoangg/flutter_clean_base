import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import '../../model/responses/user/address_model.dart';
import '../../model/responses/user/bank_model.dart';
import '../../model/responses/user/company_model.dart';
import '../../model/responses/user/coordinates_model.dart';
import '../../model/responses/user/crypto_model.dart';
import '../../model/responses/user/hair_model.dart';
import '../../model/responses/user/user_model.dart';

extension UserModelMapper on UserModel {
  UserEntity toDomain() {
    return UserEntity(
      id: id ?? ZERO,
      firstName: firstName.orEmpty(),
      lastName: lastName.orEmpty(),
      maidenName: maidenName.orEmpty(),
      age: age ?? ZERO,
      gender: gender.orEmpty(),
      email: email.orEmpty(),
      phone: phone.orEmpty(),
      username: username.orEmpty(),
      password: password.orEmpty(),
      birthDate: birthDate.orEmpty(),
      image: image.orEmpty(),
      bloodGroup: bloodGroup.orEmpty(),
      height: height ?? ZERO.toDouble(),
      weight: weight ?? ZERO.toDouble(),
      eyeColor: eyeColor.orEmpty(),
      ip: ip.orEmpty(),
      macAddress: macAddress.orEmpty(),
      university: university.orEmpty(),
      ein: ein.orEmpty(),
      ssn: ssn.orEmpty(),
      userAgent: userAgent.orEmpty(),
      role: role.orEmpty(),
      bank: bank?.toDomain() ?? BankEntity.emptyObject(),
      company: company?.toDomain() ?? CompanyEntity.emptyObject(),
      crypto: crypto?.toDomain() ?? CryptoEntity.emptyObject(),
      address: address?.toDomain() ?? AddressEntity.emptyObject(),
      hair: hair?.toDomain() ?? HairEntity.emptyObject(),
      accessToken: accessToken ?? EMPTY,
      refreshToken: refreshToken ?? EMPTY,
    );
  }
}

extension HairModelMapper on HairModel {
  HairEntity toDomain() =>
      HairEntity(color: color.orEmpty(), type: type.orEmpty());
}

extension CryptoModelMapper on CryptoModel {
  CryptoEntity toDomain() => CryptoEntity(
        coin: coin.orEmpty(),
        wallet: wallet.orEmpty(),
        network: network.orEmpty(),
      );
}

extension CompanyModelMapper on CompanyModel {
  CompanyEntity toDomain() => CompanyEntity(
        department: department.orEmpty(),
        name: name.orEmpty(),
        title: title.orEmpty(),
        address: address?.toDomain() ?? AddressEntity.emptyObject(),
      );
}

extension BankModelMapper on BankModel {
  BankEntity toDomain() => BankEntity(
        cardExpire: cardExpire.orEmpty(),
        cardNumber: cardNumber.orEmpty(),
        cardType: cardType.orEmpty(),
        currency: currency.orEmpty(),
        iban: iban.orEmpty(),
      );
}

extension AddressModelMapper on AddressModel {
  AddressEntity toDomain() => AddressEntity(
        address: address.orEmpty(),
        city: city.orEmpty(),
        state: state.orEmpty(),
        stateCode: stateCode.orEmpty(),
        postalCode: postalCode.orEmpty(),
        country: country.orEmpty(),
        coordinates: coordinates?.toDomain() ?? CoordinatesEntity.emptyObject(),
      );
}

extension CoordinatesModelMapper on CoordinatesModel {
  CoordinatesEntity toDomain() => CoordinatesEntity(
        lat: lat ?? ZERO.toDouble(),
        lng: lng ?? ZERO.toDouble(),
      );
}
