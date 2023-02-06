import 'package:go_router/go_router.dart';

import '../presentation/edit_note/screens/edit_note_screen.dart';
import '../presentation/home/screens/home_screen.dart';

class HomeRoute {
  static const home = 'home';
  static const addNote = 'addNote';
  static const editNote = 'editNote';
}

final homeNav = GoRoute(
  path: '/',
  name: HomeRoute.home,
  builder: (context, state) => const HomeScreen(),
  routes: [
    GoRoute(
      path: 'add',
      name: HomeRoute.addNote,
      builder: (context, state) => EditNoteScreen(
        noteId: null,
        onEditSuccess: (state.extra as Map<String, dynamic>)['onSuccess'],
      ),
    ),
    GoRoute(
      path: 'edit/:id',
      name: HomeRoute.editNote,
      builder: (context, state) => EditNoteScreen(
        noteId: state.params['id'],
        onEditSuccess: (state.extra as Map<String, dynamic>)['onSuccess'],
      ),
    ),
  ],
);
