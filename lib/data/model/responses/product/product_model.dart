import 'dimension_model.dart';
import 'meta_model.dart';
import 'review_model.dart';

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final DimensionsModel? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ReviewModel>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaModel? meta;
  final String? thumbnail;
  final List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.thumbnail,
    this.images,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    DimensionsModel? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ReviewModel>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    MetaModel? meta,
    String? thumbnail,
    List<String>? images,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews ?? this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta ?? this.meta,
        thumbnail: thumbnail ?? this.thumbnail,
        images: images ?? this.images,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price']?.toDouble(),
        discountPercentage: json['discountPercentage']?.toDouble(),
        rating: json['rating']?.toDouble(),
        stock: json['stock'],
        tags: json['tags'] == null
            ? []
            : List<String>.from(json['tags']?.map((x) => x)),
        brand: json['brand'],
        sku: json['sku'],
        weight: json['weight'],
        dimensions: json['dimensions'] == null
            ? null
            : DimensionsModel.fromJson(json['dimensions']),
        warrantyInformation: json['warrantyInformation'],
        shippingInformation: json['shippingInformation'],
        availabilityStatus: json['availabilityStatus'],
        reviews: json['reviews'] == null
            ? []
            : List<ReviewModel>.from(
                json['reviews']?.map((x) => ReviewModel.fromJson(x))),
        returnPolicy: json['returnPolicy'],
        minimumOrderQuantity: json['minimumOrderQuantity'],
        meta: json['meta'] == null ? null : MetaModel.fromJson(json['meta']),
        thumbnail: json['thumbnail'],
        images: json['images'] == null
            ? []
            : List<String>.from(json['images']?.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags':
            tags == null ? [] : List<dynamic>.from(tags?.map((x) => x) ?? []),
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions?.toJson(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews == null
            ? []
            : List<dynamic>.from(reviews?.map((x) => x.toJson()) ?? []),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta?.toJson(),
        'thumbnail': thumbnail,
        'images': images == null
            ? []
            : List<dynamic>.from(images?.map((x) => x) ?? []),
      };
}
