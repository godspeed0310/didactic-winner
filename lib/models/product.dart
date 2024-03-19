// ignore_for_file: invalid_annotation_target

import 'package:echelon/models/product_rating.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  const factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required ProductRating rating,
  }) = _ProductModel;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
