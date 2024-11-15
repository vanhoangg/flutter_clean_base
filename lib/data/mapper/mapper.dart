import '../../app/extensions.dart';
import '../../domain/entity/model.dart';
// to convert the response into a non nullable object (model)

import '../../domain/entity/store_details_entity.dart';
import '../responses/responses.dart';

const EMPTY = '';
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  CustomerEntity toDomain() {
    return CustomerEntity(
        this?.id?.orEmpty() ?? EMPTY,
        this?.name?.orEmpty() ?? EMPTY,
        this?.numOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  ContactsEntity toDomain() {
    return ContactsEntity(this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  AuthenticationEntity toDomain() {
    return AuthenticationEntity(
        this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? EMPTY;
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  ServiceEntity toDomain() {
    return ServiceEntity(this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY, this?.image?.orEmpty() ?? EMPTY);
  }
}

extension StoreResponseMapper on StoreResponse? {
  StoreEntity toDomain() {
    return StoreEntity(this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY, this?.image?.orEmpty() ?? EMPTY);
  }
}

extension BannerResponseMapper on BannerResponse? {
  BannerAdEntity toDomain() {
    return BannerAdEntity(
        this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY,
        this?.link?.orEmpty() ?? EMPTY);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObjectEntity toDomain() {
    final List<ServiceEntity> mappedServices =
        (this?.data?.services?.map((service) => service.toDomain()) ??
                const Iterable.empty())
            .cast<ServiceEntity>()
            .toList();

    final List<StoreEntity> mappedStores =
        (this?.data?.stores?.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<StoreEntity>()
            .toList();

    final List<BannerAdEntity> mappedBanners =
        (this?.data?.banners?.map((bannerAd) => bannerAd.toDomain()) ??
                const Iterable.empty())
            .cast<BannerAdEntity>()
            .toList();

    final data = HomeDataEntity(mappedServices, mappedStores, mappedBanners);
    return HomeObjectEntity(data);
  }
}

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetailsEntity toDomain() {
    return StoreDetailsEntity(
        this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY,
        this?.details?.orEmpty() ?? EMPTY,
        this?.services?.orEmpty() ?? EMPTY,
        this?.about?.orEmpty() ?? EMPTY);
  }
}
