import 'package:get/get.dart';
import 'package:todo/presentation/home/widgets/home_screen.dart';

import '../presentation/edit_note/widgets/edit_note_screen.dart';

enum HomeRoute {
  home(name: '/'),
  addNote(name: '/add'),
  editNote(name: '/edit/:id');

  final String name;
  const HomeRoute({required this.name});

  static HomeRoute get initialRoute => HomeRoute.home;
}

final homeNav = GetPage(
  name: HomeRoute.home.name,
  page: () => const HomeScreen(),
  children: [
    GetPage(
      name: HomeRoute.addNote.name,
      page: () => const EditNoteScreen(noteId: null),
    ),
    GetPage(
      name: HomeRoute.editNote.name,
      page: () => EditNoteScreen(noteId: Get.parameters['id']),
    ),
  ],
);
