import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_core/auth/auth_profile.dart';
import 'package:redux_core/failure/failure.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required AuthStatus status,
    required AuthProfile? profile,
    required Failure? failure,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        status: AuthStatus.unauthenticated,
        profile: null,
        failure: null,
      );
}

enum AuthStatus { unauthenticated, loading, authenticated, failure }
