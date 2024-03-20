// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductRatingAdapter extends TypeAdapter<ProductRating> {
  @override
  final int typeId = 1;

  @override
  ProductRating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductRating(
      rate: fields[0] as double,
      count: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductRating obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductRatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
