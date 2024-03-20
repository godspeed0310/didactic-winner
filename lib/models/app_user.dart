import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@unfreezed
@HiveType(typeId: 2)
class AppUser with _$AppUser {
  factory AppUser({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) String? name,
    @HiveField(3) String? photoURL,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
