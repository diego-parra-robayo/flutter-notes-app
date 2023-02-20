import 'package:auth/navigation/auth_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/notes_routes.dart';

final appRouter = GoRouter(
  initialLocation: '/notes',
  routes: [
    ...authRoutes,
    ...notesRoutes,
  ],
);
