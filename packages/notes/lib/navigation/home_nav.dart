import 'package:core/di/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../presentation/edit_note/screens/edit_note_screen.dart';
import '../presentation/home/bloc/home_bloc.dart';
import '../presentation/home/screens/home_screen.dart';

class HomeRoute {
  static const home = 'home';
  static const addNote = 'addNote';
  static const editNote = 'editNote';
}

final homeNav = ShellRoute(
    builder: (context, state, child) => BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(HomeStarted()),
      child: child,
        ),
    routes: [
      GoRoute(
        path: '/',
        name: HomeRoute.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'add',
            name: HomeRoute.addNote,
            builder: (context, state) => const EditNoteScreen(noteId: null),
          ),
          GoRoute(
            path: 'edit/:id',
            name: HomeRoute.editNote,
            builder: (context, state) =>
                EditNoteScreen(noteId: state.params['id']),
          ),
        ],
      ),
    ]);
