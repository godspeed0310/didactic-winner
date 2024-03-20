// ignore_for_file: invalid_annotation_target

import 'package:echelon/models/product_rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@HiveType(typeId: 0)
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  const factory Product({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required double price,
    @HiveField(3) required String description,
    @HiveField(4) required String category,
    @HiveField(5) required String image,
    @HiveField(6) required ProductRating rating,
  }) = _ProductModel;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
