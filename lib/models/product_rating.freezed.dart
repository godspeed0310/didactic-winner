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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRatingCopyWith<$Res> {
  factory $ProductRatingCopyWith(
          ProductRating value, $Res Function(ProductRating) then) =
      _$ProductRatingCopyWithImpl<$Res, ProductRating>;
}

/// @nodoc
class _$ProductRatingCopyWithImpl<$Res, $Val extends ProductRating>
    implements $ProductRatingCopyWith<$Res> {
  _$ProductRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductRatingImplCopyWith<$Res> {
  factory _$$ProductRatingImplCopyWith(
          _$ProductRatingImpl value, $Res Function(_$ProductRatingImpl) then) =
      __$$ProductRatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductRatingImplCopyWithImpl<$Res>
    extends _$ProductRatingCopyWithImpl<$Res, _$ProductRatingImpl>
    implements _$$ProductRatingImplCopyWith<$Res> {
  __$$ProductRatingImplCopyWithImpl(
      _$ProductRatingImpl _value, $Res Function(_$ProductRatingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ProductRatingImpl implements _ProductRating {
  const _$ProductRatingImpl();

  factory _$ProductRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRatingImplFromJson(json);

  @override
  String toString() {
    return 'ProductRating()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductRatingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRatingImplToJson(
      this,
    );
  }
}

abstract class _ProductRating implements ProductRating {
  const factory _ProductRating() = _$ProductRatingImpl;

  factory _ProductRating.fromJson(Map<String, dynamic> json) =
      _$ProductRatingImpl.fromJson;
}
