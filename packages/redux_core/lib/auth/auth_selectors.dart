import 'package:redux_core/auth/auth_state.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

AuthState _selectAuthState(AppState state) => state.auth;

final selectAuthIsLoading = createSelector1(
  _selectAuthState,
  (authState) => authState.status == AuthStatus.loading,
);

final selectAuthFailure = createSelector1(
  _selectAuthState,
  (authState) => authState.status == AuthStatus.failure
      ? authState.failure?.message
      : null,
);

final selectAuthIsAuthenticated = createSelector1(
  _selectAuthState,
  (authState) => authState.status == AuthStatus.authenticated,
);

final selectAuthenticatedProfile = createSelector1(
  _selectAuthState,
  (authState) =>
      authState.status == AuthStatus.authenticated ? authState.profile : null,
);
