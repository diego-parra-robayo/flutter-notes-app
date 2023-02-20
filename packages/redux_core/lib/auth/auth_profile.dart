import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_profile.freezed.dart';

@freezed
class AuthProfile with _$AuthProfile {
  factory AuthProfile({
    required String userId,
    required String name,
  }) = _AuthProfile;
}
