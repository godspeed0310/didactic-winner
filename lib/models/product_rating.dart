import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_rating.freezed.dart';
part 'product_rating.g.dart';

@freezed
@HiveType(typeId: 1)
class ProductRating with _$ProductRating {
  const factory ProductRating({
    @HiveField(0) required double rate,
    @HiveField(1) required int count,
  }) = _ProductRating;

  factory ProductRating.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingFromJson(json);
}
