import 'package:auth/presentation/screens/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

class AuthRoute {
  const AuthRoute._();

  static const signIn = 'auth/login';
}

final authRoutes = [
  GoRoute(
    path: '/auth/login',
    name: AuthRoute.signIn,
    builder: (context, state) => const SignInScreen(),
  ),
];
