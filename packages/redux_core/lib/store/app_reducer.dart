import 'package:redux_core/auth/auth_reducer.dart';
import 'package:redux_core/notes/notes_reducer.dart';
import 'package:redux_core/store/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    auth: authReducer(state.auth, action),
    notes: notesReducer(state.notes, action),
  );
}
