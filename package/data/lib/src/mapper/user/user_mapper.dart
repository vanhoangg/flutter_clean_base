import 'package:domain/domain.dart';
import 'package:shared/shared.dart';

import '../../model/responses/user/address_model.dart';
import '../../model/responses/user/bank_model.dart';
import '../../model/responses/user/company_model.dart';
import '../../model/responses/user/coordinates_model.dart';
import '../../model/responses/user/crypto_model.dart';
import '../../model/responses/user/hair_model.dart';
import '../../model/responses/user/user_model.dart';

extension UserModelMapper on UserModel? {
  UserEntity toDomain() => UserEntity(
        id: this?.id ?? ZERO,
        firstName: this?.firstName.orEmpty() ?? EMPTY,
        lastName: this?.lastName.orEmpty() ?? EMPTY,
        maidenName: this?.maidenName.orEmpty() ?? EMPTY,
        age: this?.age ?? ZERO,
        gender: this?.gender.orEmpty() ?? EMPTY,
        email: this?.email.orEmpty() ?? EMPTY,
        phone: this?.phone.orEmpty() ?? EMPTY,
        username: this?.username.orEmpty() ?? EMPTY,
        password: this?.password.orEmpty() ?? EMPTY,
        birthDate: this?.birthDate.orEmpty() ?? EMPTY,
        image: this?.image.orEmpty() ?? EMPTY,
        bloodGroup: this?.bloodGroup.orEmpty() ?? EMPTY,
        height: this?.height ?? ZERO.toDouble(),
        weight: this?.weight ?? ZERO.toDouble(),
        eyeColor: this?.eyeColor.orEmpty() ?? EMPTY,
        ip: this?.ip.orEmpty() ?? EMPTY,
        macAddress: this?.macAddress.orEmpty() ?? EMPTY,
        university: this?.university.orEmpty() ?? EMPTY,
        ein: this?.ein.orEmpty() ?? EMPTY,
        ssn: this?.ssn.orEmpty() ?? EMPTY,
        userAgent: this?.userAgent.orEmpty() ?? EMPTY,
        role: this?.role.orEmpty() ?? EMPTY,
        bank: this?.bank?.toDomain(),
        company: this?.company?.toDomain(),
        crypto: this?.crypto?.toDomain(),
        address: this?.address?.toDomain(),
        hair: this?.hair.toDomain(),
      );
}

extension HairModelMapper on HairModel? {
  HairEntity toDomain() => HairEntity(
      color: this?.color.orEmpty() ?? EMPTY,
      type: this?.type.orEmpty() ?? EMPTY);
}

extension CryptoModelMapper on CryptoModel? {
  CryptoEntity toDomain() => CryptoEntity(
        coin: this?.coin.orEmpty() ?? EMPTY,
        wallet: this?.wallet.orEmpty() ?? EMPTY,
        network: this?.network.orEmpty() ?? EMPTY,
      );
}

extension CompanyModelMapper on CompanyModel? {
  CompanyEntity toDomain() => CompanyEntity(
        department: this?.department.orEmpty() ?? EMPTY,
        name: this?.name.orEmpty() ?? EMPTY,
        title: this?.title.orEmpty() ?? EMPTY,
        address: this?.address?.toDomain(),
      );
}

extension BankModelMapper on BankModel? {
  BankEntity toDomain() => BankEntity(
        cardExpire: this?.cardExpire.orEmpty() ?? EMPTY,
        cardNumber: this?.cardNumber.orEmpty() ?? EMPTY,
        cardType: this?.cardType.orEmpty() ?? EMPTY,
        currency: this?.currency.orEmpty() ?? EMPTY,
        iban: this?.iban.orEmpty() ?? EMPTY,
      );
}

extension AddressModelMapper on AddressModel? {
  AddressEntity toDomain() => AddressEntity(
        address: this?.address.orEmpty() ?? EMPTY,
        city: this?.city.orEmpty() ?? EMPTY,
        state: this?.state.orEmpty() ?? EMPTY,
        stateCode: this?.stateCode.orEmpty() ?? EMPTY,
        postalCode: this?.postalCode.orEmpty() ?? EMPTY,
        country: this?.country.orEmpty() ?? EMPTY,
        coordinates: this?.coordinates?.toDomain(),
      );
}

extension CoordinatesModelMapper on CoordinatesModel? {
  CoordinatesEntity toDomain() => CoordinatesEntity(
        lat: this?.lat ?? ZERO.toDouble(),
        lng: this?.lng ?? ZERO.toDouble(),
      );
}
