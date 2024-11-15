class SliderObjectEntity {
  String title;
  String subTitle;
  String image;

  SliderObjectEntity(this.title, this.subTitle, this.image);
}

class CustomerEntity {
  String id;
  String name;
  int numOfNotifications;

  CustomerEntity(this.id, this.name, this.numOfNotifications);
}

class ContactsEntity {
  String email;
  String phone;
  String link;

  ContactsEntity(this.email, this.phone, this.link);
}

class AuthenticationEntity {
  CustomerEntity? customer;
  ContactsEntity? contacts;

  AuthenticationEntity(this.customer, this.contacts);
}

class DeviceInfoEntity {
  String name;
  String identifier;
  String version;

  DeviceInfoEntity(this.name, this.identifier, this.version);
}

class ServiceEntity {
  int id;
  String title;
  String image;

  ServiceEntity(this.id, this.title, this.image);
}

class StoreEntity {
  int id;
  String title;
  String image;

  StoreEntity(this.id, this.title, this.image);
}

class BannerAdEntity {
  int id;
  String title;
  String image;
  String link;

  BannerAdEntity(this.id, this.title, this.image, this.link);
}

class HomeDataEntity {
  List<ServiceEntity> services;
  List<StoreEntity> stores;
  List<BannerAdEntity> banners;

  HomeDataEntity(this.services, this.stores, this.banners);
}

class HomeObjectEntity {
  HomeDataEntity data;

  HomeObjectEntity(this.data);
}
