import 'package:redux_core/auth/auth_profile.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/utils/action.dart';

class SetAuthLoadingAction extends Action {}

class SetAuthFailureAction extends Action {
  final Failure failure;

  const SetAuthFailureAction({required this.failure});
}

class SetAuthProfileAction extends Action {
  final AuthProfile profile;

  const SetAuthProfileAction(this.profile);
}

class SignOutAction extends Action {
  const SignOutAction();
}
