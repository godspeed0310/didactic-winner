// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRating _$ProductRatingFromJson(Map<String, dynamic> json) {
  return _ProductRating.fromJson(json);
}

/// @nodoc
mixin _$ProductRating {
  @HiveField(0)
  double get rate => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductRatingCopyWith<ProductRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRatingCopyWith<$Res> {
  factory $ProductRatingCopyWith(
          ProductRating value, $Res Function(ProductRating) then) =
      _$ProductRatingCopyWithImpl<$Res, ProductRating>;
  @useResult
  $Res call({@HiveField(0) double rate, @HiveField(1) int count});
}

/// @nodoc
class _$ProductRatingCopyWithImpl<$Res, $Val extends ProductRating>
    implements $ProductRatingCopyWith<$Res> {
  _$ProductRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductRatingImplCopyWith<$Res>
    implements $ProductRatingCopyWith<$Res> {
  factory _$$ProductRatingImplCopyWith(
          _$ProductRatingImpl value, $Res Function(_$ProductRatingImpl) then) =
      __$$ProductRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) double rate, @HiveField(1) int count});
}

/// @nodoc
class __$$ProductRatingImplCopyWithImpl<$Res>
    extends _$ProductRatingCopyWithImpl<$Res, _$ProductRatingImpl>
    implements _$$ProductRatingImplCopyWith<$Res> {
  __$$ProductRatingImplCopyWithImpl(
      _$ProductRatingImpl _value, $Res Function(_$ProductRatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? count = null,
  }) {
    return _then(_$ProductRatingImpl(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRatingImpl implements _ProductRating {
  const _$ProductRatingImpl(
      {@HiveField(0) required this.rate, @HiveField(1) required this.count});

  factory _$ProductRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRatingImplFromJson(json);

  @override
  @HiveField(0)
  final double rate;
  @override
  @HiveField(1)
  final int count;

  @override
  String toString() {
    return 'ProductRating(rate: $rate, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRatingImpl &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rate, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRatingImplCopyWith<_$ProductRatingImpl> get copyWith =>
      __$$ProductRatingImplCopyWithImpl<_$ProductRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRatingImplToJson(
      this,
    );
  }
}

abstract class _ProductRating implements ProductRating {
  const factory _ProductRating(
      {@HiveField(0) required final double rate,
      @HiveField(1) required final int count}) = _$ProductRatingImpl;

  factory _ProductRating.fromJson(Map<String, dynamic> json) =
      _$ProductRatingImpl.fromJson;

  @override
  @HiveField(0)
  double get rate;
  @override
  @HiveField(1)
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$ProductRatingImplCopyWith<_$ProductRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
