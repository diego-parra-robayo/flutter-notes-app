import 'package:auth/data/datasources/fake/fake_auth_datasource.dart';
import 'package:auth/data/repositories/fake_auth_repository.dart';
import 'package:auth/domain/middlewares/middlewares.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:core/di/di_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

class AuthDi extends DiSchema {
  static AuthDi get instance => GetIt.instance.get();

  final void Function(BuildContext context) onAuthenticatedSuccess;

  AuthDi({
    required this.onAuthenticatedSuccess,
  });

  @override
  void registerDataSources() {
    getIt.registerLazySingleton<FakeAuthDataSource>(
      () => const FakeAuthDataSource(),
    );
  }

  @override
  void registerRepositories() {
    getIt.registerLazySingleton<AuthRepository>(
      () => FakeAuthRepository(dataSource: getIt()),
    );
  }

  @override
  void registerMiddlewares() {
    getIt.registerLazySingleton<List<Middleware<AppState>>>(
      () => [
        SignInMiddleware(repository: getIt()),
        SignOutMiddleware(repository: getIt()),
      ],
      instanceName: middlewaresKey,
    );
  }

  List<Middleware<AppState>> get middlewares =>
      getIt(instanceName: middlewaresKey);
}
