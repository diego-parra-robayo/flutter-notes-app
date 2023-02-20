import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthRoute {
  const AuthRoute._();

  static const signIn = 'auth/login';
}

final authRoutes = [
  GoRoute(
    path: '/auth/login',
    name: AuthRoute.signIn,
    builder: (context, state) => const Scaffold(
      body: Center(child: Text('Login screen')),
    ),
  ),
];
