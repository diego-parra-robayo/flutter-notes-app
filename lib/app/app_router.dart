import 'package:auth/navigation/auth_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/notes_routes.dart';
import 'package:redux_core/auth/auth_selectors.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

final appRouter = GoRouter(
  initialLocation: '/notes',
  redirect: (context, state) {
    final appState = StoreProvider.of<AppState>(context, listen: false).state;
    if (!selectAuthIsAuthenticated(appState) &&
        state.name != AuthRoute.signIn) {
      return '/auth/login';
    }
    return null;
  },
  routes: [
    ...authRoutes,
    ...notesRoutes,
  ],
);
