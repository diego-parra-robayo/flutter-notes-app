import 'package:auth/di/auth_di.dart';
import 'package:auth/domain/middlewares/sign_in_middleware.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux_core/auth/auth_selectors.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:ui/widgets_base/resource_connector.dart';

class SignInConnector extends StatelessWidget {
  final Widget Function(BuildContext context, SignInCallback onSignIn) builder;

  const SignInConnector({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourceConnector<AppState, SignInCallback>(
      loadingSelector: selectAuthIsLoading,
      popUpMessageSelector: selectAuthFailure,
      additionalListeners: [
        ListenerPair(
          selector: selectAuthIsAuthenticated,
          listener: (context, authenticated) {
            if (authenticated) {
              AuthDi.instance.onAuthenticatedSuccess(context);
            }
          },
        ),
      ],
      dataConverter: (store) => (formData) => store.dispatch(
            SignInRequest(
              email: formData.email,
              password: formData.password,
            ),
          ),
      dataBuilder: builder,
    );
  }
}

typedef SignInCallback = void Function(SignInFormData data);

class SignInFormData extends Equatable {
  final String email;
  final String password;

  const SignInFormData({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
