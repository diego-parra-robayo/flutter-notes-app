import 'package:auth/domain/repositories/auth_repository.dart';
import 'package:redux_core/auth/auth_actions.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

class SignOutRequest extends Action {
  const SignOutRequest();
}

class SignOutMiddleware extends CustomMiddleware<SignOutRequest> {
  final AuthRepository repository;

  SignOutMiddleware({required this.repository});

  @override
  Future execute(Store<AppState> store, SignOutRequest action) async {
    store.dispatch(SetAuthLoadingAction());
    await repository.signOut();
    store.dispatch(const SignOutAction());
  }

  @override
  void onFailure(
    Store<AppState> store,
    SignOutRequest action,
    Failure failure,
  ) {
    store.dispatch(SetAuthFailureAction(failure: failure));
  }
}
