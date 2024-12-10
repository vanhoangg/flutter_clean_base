class MetaModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;

  MetaModel({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  MetaModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) =>
      MetaModel(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        barcode: barcode ?? this.barcode,
        qrCode: qrCode ?? this.qrCode,
      );

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        barcode: json['barcode'],
        qrCode: json['qrCode'],
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'barcode': barcode,
        'qrCode': qrCode,
      };
}
