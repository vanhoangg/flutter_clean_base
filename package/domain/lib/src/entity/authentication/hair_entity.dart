import 'package:shared/shared.dart';

import '../base_entity.dart';

class HairEntity extends BaseEntity {
  final String color;
  final String type;

  HairEntity({
    required this.color,
    required this.type,
  });

  @override
  HairEntity copyWith({
    String? color,
    String? type,
  }) =>
      HairEntity(
        color: color ?? this.color,
        type: type ?? this.type,
      );
  factory HairEntity.emptyObject() => HairEntity(color: EMPTY, type: EMPTY);
}
