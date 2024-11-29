import 'package:shared/shared.dart';

import '../base_entity.dart';

class CryptoEntity extends BaseEntity {
  final String coin;
  final String wallet;
  final String network;

  CryptoEntity({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  @override
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
  factory CryptoEntity.emptyObject() =>
      CryptoEntity(coin: EMPTY, wallet: EMPTY, network: EMPTY);
}
