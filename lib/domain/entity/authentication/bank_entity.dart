class BankEntity {
  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  BankEntity({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  BankEntity copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) =>
      BankEntity(
        cardExpire: cardExpire ?? this.cardExpire,
        cardNumber: cardNumber ?? this.cardNumber,
        cardType: cardType ?? this.cardType,
        currency: currency ?? this.currency,
        iban: iban ?? this.iban,
      );
}
