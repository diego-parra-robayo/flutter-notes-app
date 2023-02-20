import 'package:auth/data/datasources/fake/auth_profile_dto.dart';
import 'package:auth/data/datasources/fake/fake_auth_datasource.dart';
import 'package:auth/domain/entities/sign_in_request_entity.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:redux_core/auth/auth_profile.dart';

class FakeAuthRepository implements AuthRepository {
  final FakeAuthDataSource dataSource;

  const FakeAuthRepository({
    required this.dataSource,
  });

  @override
  Future<AuthProfile> signIn({
    required SignInRequestEntity request,
  }) async {
    final profile = await dataSource.signIn(request: request);
    return profile.toAuthProfile();
  }

  @override
  Future<void> signOut() => dataSource.signOut();
}
