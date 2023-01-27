import 'package:go_router/go_router.dart';

import '../presentation/screens/edit_note_screen.dart';
import '../presentation/screens/home_screen.dart';

enum HomeRoute {
  home(name: 'home'),
  addNote(name: 'addNote'),
  editNote(name: 'editNote');

  final String name;

  const HomeRoute({required this.name});

  static HomeRoute get initialRoute => HomeRoute.home;
}

final homeNav = GoRoute(
  path: '/',
  name: HomeRoute.home.name,
  builder: (context, state) => const HomeScreen(),
  routes: [
    GoRoute(
      path: 'add',
      name: HomeRoute.addNote.name,
      builder: (context, state) => const EditNoteScreen(noteId: null),
    ),
    GoRoute(
      path: 'edit/:id',
      name: HomeRoute.editNote.name,
      builder: (context, state) => EditNoteScreen(noteId: state.params['id']),
    ),
  ],
);
