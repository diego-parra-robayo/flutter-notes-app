import 'package:auth/data/datasources/fake/auth_profile_dto.dart';
import 'package:auth/domain/entities/sign_in_request_entity.dart';

class FakeAuthDataSource {
  final Duration delay;
  final bool Function(String email, String password)? passwordValidator;

  const FakeAuthDataSource({
    this.passwordValidator,
    this.delay = const Duration(milliseconds: 1000),
  });

  Future<AuthProfileDto> signIn({
    required SignInRequestEntity request,
  }) async {
    await Future.delayed(delay);
    if (_safePasswordValidator(request.email, request.password)) {
      return AuthProfileDto(
        id: request.email,
        name: request.email.substring(0, request.email.indexOf('@')),
        email: request.email,
      );
    }
    throw Exception('email or password is incorrect');
  }

  Future<void> signOut() async {
    await Future.delayed(delay);
    return;
  }
}

extension on FakeAuthDataSource {
  bool _safePasswordValidator(String email, String password) {
    return passwordValidator != null
        ? passwordValidator!(email, password)
        : password == '1234';
  }
}
