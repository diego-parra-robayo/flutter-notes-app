import 'package:auth/domain/middlewares/middlewares.dart';
import 'package:flutter/material.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

class SignOutConnector extends StatelessWidget {
  final Widget Function(BuildContext context, SignOutCallback callback) builder;

  const SignOutConnector({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignOutCallback>(
      distinct: true,
      converter: (store) => () => store.dispatch(const SignOutRequest()),
      builder: builder,
    );
  }
}

typedef SignOutCallback = void Function();
