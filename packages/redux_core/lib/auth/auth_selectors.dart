import 'package:redux_core/auth/auth_state.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

import 'auth_profile.dart';

AuthState _selectAuthState(AppState state) => state.auth;

final bool Function(AppState) selectAuthIsLoading = createSelector1(
  _selectAuthState,
  (authState) => authState.status == AuthStatus.loading,
);

final String? Function(AppState) selectAuthFailure = createSelector1(
  _selectAuthState,
  (authState) => authState.status == AuthStatus.failure
      ? authState.failure?.message
      : null,
);

final bool? Function(AppState) selectAuthIsAuthenticated = createSelector1(
  _selectAuthState,
  (authState) {
    if (authState.status == AuthStatus.authenticated) return true;
    if (authState.status == AuthStatus.unauthenticated) return false;
    return null;
  },
);

final AuthProfile? Function(AppState) selectAuthenticatedProfile = createSelector1(
  _selectAuthState,
  (authState) =>
      authState.status == AuthStatus.authenticated ? authState.profile : null,
);
