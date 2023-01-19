import 'package:get/get.dart';
import 'package:todo/presentation/add_note/widgets/add_note_screen.dart';
import 'package:todo/presentation/home/widgets/home_screen.dart';

enum HomeRoute {
  home(name: '/'),
  addNote(name: '/add');

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
      page: () => const AddNoteScreen(),
    )
  ],
);
