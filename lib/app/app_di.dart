import 'package:auth/di/auth_di.dart';
import 'package:notes/di/notes_di.dart';

class AppDi {
  static void init() {
    AuthDi();
    NotesDi();
  }
}
