import 'package:redux/redux.dart';

import 'auth_actions.dart';
import 'auth_state.dart';

final Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, SetAuthLoadingAction>(_setAuthLoading),
  TypedReducer<AuthState, SetAuthFailureAction>(_setAuthFailure),
  TypedReducer<AuthState, SetAuthProfileAction>(_setAuthenticatedUser),
  TypedReducer<AuthState, SignOutAction>(_signOutUser),
]);

AuthState _setAuthLoading(AuthState state, SetAuthLoadingAction action) {
  return state.copyWith(status: AuthStatus.loading);
}

AuthState _setAuthFailure(AuthState state, SetAuthFailureAction action) {
  return state.copyWith(
    status: AuthStatus.failure,
    failure: action.failure,
  );
}

AuthState _setAuthenticatedUser(
  AuthState state,
  SetAuthProfileAction action,
) {
  return state.copyWith(
    status: AuthStatus.authenticated,
    profile: action.profile,
  );
}

AuthState _signOutUser(AuthState state, SignOutAction action) {
  return state.copyWith(
    status: AuthStatus.unauthenticated,
    profile: null,
  );
}
