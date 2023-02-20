import 'package:auth/domain/entities/sign_in_request_entity.dart';
import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:redux_core/auth/auth_actions.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

class SignInRequest extends Action {
  final String email;
  final String password;

  const SignInRequest({
    required this.email,
    required this.password,
  });
}

class SignInMiddleware extends CustomMiddleware<SignInRequest> {
  final AuthRepository repository;

  SignInMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, SignInRequest action) async {
    store.dispatch(SetAuthLoadingAction());
    final profile = await repository.signIn(
      request: SignInRequestEntity(
        email: action.email,
        password: action.password,
      ),
    );
    store.dispatch(SetAuthProfileAction(profile));
  }

  @override
  void onFailure(Store<AppState> store, SignInRequest action, Failure failure) {
    store.dispatch(SetAuthFailureAction(failure: failure));
  }
}
