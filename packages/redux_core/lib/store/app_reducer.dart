import 'package:redux_core/reducers/note_details_reducer.dart';
import 'package:redux_core/reducers/notes_reducer.dart';
import 'package:redux_core/store/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    notes: notesReducer(state.notes, action),
    noteDetails: noteDetailsReducer(state.noteDetails, action),
  );
}
