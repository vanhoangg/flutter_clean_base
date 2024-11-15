import 'package:equatable/equatable.dart';

import '../../app/constant.dart';

class StoreDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final String details;
  final String services;
  final String about;
  factory StoreDetailsEntity.empty() {
    return const StoreDetailsEntity(
        -1,
        Constant.defaultTitleEmtpy,
        Constant.defaultStringEmtpy,
        Constant.defaultStringEmtpy,
        Constant.defaultStringEmtpy,
        Constant.defaultStringEmtpy);
  }

  const StoreDetailsEntity(
      this.id, this.title, this.image, this.details, this.services, this.about);

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        details,
        services,
        about,
      ];
}
