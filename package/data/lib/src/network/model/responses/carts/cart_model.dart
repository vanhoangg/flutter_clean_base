import '../../base_model.dart';
import '../product/product_model.dart';

class CartModel extends BaseModel {
  final int? id;
  final List<ProductModel>? products;
  final double? total;
  final double? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  CartModel({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  CartModel copyWith({
    int? id,
    List<ProductModel>? products,
    double? total,
    double? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) =>
      CartModel(
        id: id ?? this.id,
        products: products ?? this.products,
        total: total ?? this.total,
        discountedTotal: discountedTotal ?? this.discountedTotal,
        userId: userId ?? this.userId,
        totalProducts: totalProducts ?? this.totalProducts,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        products: json['products'] == null
            ? []
            : List<ProductModel>.from(
                json['products']?.map((x) => ProductModel.fromJson(x))),
        total: json['total']?.toDouble(),
        discountedTotal: json['discountedTotal']?.toDouble(),
        userId: json['userId'],
        totalProducts: json['totalProducts'],
        totalQuantity: json['totalQuantity'],
      );

  @override
  String get keyMap => 'carts';
}
