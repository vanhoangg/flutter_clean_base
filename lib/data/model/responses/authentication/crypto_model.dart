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
