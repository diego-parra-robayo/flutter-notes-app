import 'package:core/extensions/list_extensions.dart';
import 'package:redux_core/entities/entities.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/state/notes_state.dart';

bool selectNotesIsLoading(AppState state) =>
    state.notes.status == NotesStatus.loading;

List<Note> selectNotes(AppState state) => state.notes.data;

Note? selectNote(AppState state, String id) =>
    state.notes.data.firstOrNull((note) => note.id == id);

Failure? _selectNotesFailure(AppState state) =>
    state.notes.status == NotesStatus.failure ? state.notes.failure : null;

String? selectNotesPopUpMessage(AppState state) {
  final failure = _selectNotesFailure(state);
  if (failure?.type == FailureType.popUpMessage) {
    return failure?.message;
  }
  return null;
}

String? selectNotesBreakingMessage(AppState state) {
  final failure = _selectNotesFailure(state);
  if (failure?.type == FailureType.breakingMessage) {
    return failure?.message;
  }
  return null;
}
