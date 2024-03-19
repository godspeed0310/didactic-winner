import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_rating.freezed.dart';
part 'product_rating.g.dart';

@freezed
class ProductRating with _$ProductRating {
  const factory ProductRating() = _ProductRating;

  factory ProductRating.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingFromJson(json);
}
