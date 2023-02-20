import 'package:auth/domain/entities/sign_in_request_entity.dart';
import 'package:redux_core/auth/auth_profile.dart';

abstract class AuthRepository {
  Future<AuthProfile> signIn({
    required SignInRequestEntity request,
  });

  Future<void> signOut();
}
