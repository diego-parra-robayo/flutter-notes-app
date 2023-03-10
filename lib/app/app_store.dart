import 'package:auth/di/auth_di.dart';
import 'package:notes/di/notes_di.dart';
import 'package:redux_core/store/store.dart';

final appStore = createStore(
  middleware: [
    ...AuthDi.instance.middlewares,
    ...NotesDi.instance.middlewares,
  ],
);
