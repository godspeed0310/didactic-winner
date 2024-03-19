// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRatingImpl _$$ProductRatingImplFromJson(Map<String, dynamic> json) =>
    _$ProductRatingImpl(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$ProductRatingImplToJson(_$ProductRatingImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
