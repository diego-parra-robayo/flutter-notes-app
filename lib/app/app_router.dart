import 'package:go_router/go_router.dart';
import 'package:notes/navigation/notes_routes.dart';

final appRouter = GoRouter(
  routes: [
    ...notesRoutes,
  ],
);
