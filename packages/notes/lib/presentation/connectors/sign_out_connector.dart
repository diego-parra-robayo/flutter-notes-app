import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/di/notes_di.dart';
import 'package:redux_core/auth/auth_selectors.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:ui/widgets_base/resource_connector.dart';

class SignOutConnector extends StatelessWidget {
  final Widget Function(BuildContext context, SignOutViewModel vm)
      builder;

  const SignOutConnector({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourceConnector(
      popUpMessageSelector: selectAuthFailure,
      additionalListeners: [
        ListenerPair(
          selector: selectAuthIsAuthenticated,
          listener: (context, isAuthenticated) {
            if (!isAuthenticated) NotesDi.instance.onSignedOut(context);
          },
        )
      ],
      dataConverter: SignOutViewModel.fromStore,
      dataBuilder: builder,
    );
  }
}

class SignOutViewModel extends Equatable {
  final bool isLoading;
  final SignOutCallback onSignOut;

  const SignOutViewModel({
    required this.isLoading,
    required this.onSignOut,
  });

  factory SignOutViewModel.fromStore(Store<AppState> store) => SignOutViewModel(
        isLoading: selectAuthIsLoading(store.state),
        onSignOut: () => NotesDi.instance.onSignOut(store),
      );

  @override
  List<Object?> get props => [isLoading];
}

typedef SignOutCallback = void Function();
