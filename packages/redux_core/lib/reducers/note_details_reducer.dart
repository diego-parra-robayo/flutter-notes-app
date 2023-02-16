import 'package:core/extensions/list_extensions.dart';
import 'package:redux/redux.dart';
import 'package:redux_core/actions/note_details_action.dart';
import 'package:redux_core/actions/notes_actions.dart';
import 'package:redux_core/state/note_details_state.dart';

final noteDetailsReducer = combineReducers([
  TypedReducer<NoteDetailsState, SetNoteDetailsLoadingAction>(
      _setNoteDetailsLoading),
  TypedReducer<NoteDetailsState, SetNoteDetailsFailureAction>(
      _setNoteDetailsFailure),
  TypedReducer<NoteDetailsState, SetNotesAction>(_setNotes),
  TypedReducer<NoteDetailsState, AddNoteAction>(_addNote),
  TypedReducer<NoteDetailsState, UpdateNoteAction>(_updateNote),
  TypedReducer<NoteDetailsState, DeleteNoteAction>(_deleteNote),
]);

NoteDetailsState _setNoteDetailsLoading(
  NoteDetailsState state,
  SetNoteDetailsLoadingAction action,
) {
  return state.copyWith(status: NoteDetailsStatus.loading);
}

NoteDetailsState _setNoteDetailsFailure(
  NoteDetailsState state,
  SetNoteDetailsFailureAction action,
) {
  return state.copyWith(
    status: NoteDetailsStatus.failure,
    failure: action.failure,
  );
}

NoteDetailsState _setNotes(NoteDetailsState state, SetNotesAction action) {
  return state.copyWith(
    status: NoteDetailsStatus.success,
    data: state.data != null
        ? action.notes.firstOrNull((note) => note.id == state.data!.id)
        : null,
  );
}

NoteDetailsState _addNote(NoteDetailsState state, AddNoteAction action) {
  return state.copyWith(
    status: NoteDetailsStatus.success,
    data: action.newNote,
  );
}

NoteDetailsState _updateNote(NoteDetailsState state, UpdateNoteAction action) {
  return state.copyWith(
    status: NoteDetailsStatus.success,
    data: action.updatedNote,
  );
}

NoteDetailsState _deleteNote(NoteDetailsState state, DeleteNoteAction action) {
  return state.copyWith(
    status: NoteDetailsStatus.success,
    data: null,
  );
}
