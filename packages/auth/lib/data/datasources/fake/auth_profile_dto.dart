import 'package:equatable/equatable.dart';
import 'package:redux_core/auth/auth_profile.dart';

class AuthProfileDto extends Equatable {
  final String id;
  final String? name;
  final String? email;

  const AuthProfileDto({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}

extension AuthProfileDtoX on AuthProfileDto {
  AuthProfile toAuthProfile() => AuthProfile(
        userId: id,
        name: name ?? '',
      );
}
