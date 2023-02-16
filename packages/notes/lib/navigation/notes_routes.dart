import 'package:go_router/go_router.dart';
import 'package:notes/presentation/screens/edit_note_screen.dart';
import 'package:notes/presentation/screens/home/home_screen.dart';

class NotesRoute {
  static const home = 'notes/home';
  static const addNote = 'notes/add';
  static const editNote = 'notes/edit';
}

final notesRoutes = [
  GoRoute(
    path: '/',
    name: NotesRoute.home,
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'add',
        name: NotesRoute.addNote,
        builder: (context, state) => const EditNoteScreen(noteId: null),
      ),
      GoRoute(
        path: 'edit/:id',
        name: NotesRoute.editNote,
        builder: (context, state) => EditNoteScreen(noteId: state.params['id']),
      ),
    ],
  ),
];
