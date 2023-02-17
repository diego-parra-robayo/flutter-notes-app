import 'package:core/extensions/list_extensions.dart';
import 'package:redux/redux.dart';
import 'package:redux_core/actions/note_details_action.dart';
import 'package:redux_core/actions/notes_actions.dart';
import 'package:redux_core/entities/note.dart';
import 'package:redux_core/state/note_details_state.dart';

final noteDetailsReducer = combineReducers([
  TypedReducer<NoteDetailsState, SetNoteDetailsLoadingAction>(
      _setNoteDetailsLoading),
  TypedReducer<NoteDetailsState, SetNoteDetailsFailureAction>(
      _setNoteDetailsFailure),
  TypedReducer<NoteDetailsState, dynamic>(_updateNoteDetails),
  TypedReducer<NoteDetailsState, SetNotesAction>(_setNotes),
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
    status: action.isBreakingFailure
        ? NoteDetailsStatus.breakingFailure
        : NoteDetailsStatus.popUpFailure,
    failure: action.failure,
  );
}

NoteDetailsState _updateNoteDetails(NoteDetailsState state, dynamic action) {
  if (action is SetNoteDetailsAction ||
      action is AddNoteAction ||
      action is UpdateNoteAction ||
      action is DeleteNoteAction) {
    final Note? note;
    if (action is SetNoteDetailsAction) {
      note = action.note;
    } else if (action is AddNoteAction) {
      note = action.newNote;
    } else if (action is UpdateNoteAction) {
      note = action.updatedNote;
    } else if (action is DeleteNoteAction) {
      note = null;
    } else {
      throw Exception('Unknown action type');
    }
    return state.copyWith(
      status: NoteDetailsStatus.saveSuccess,
      data: note,
    );
  }
  return state;
}

NoteDetailsState _setNotes(NoteDetailsState state, SetNotesAction action) {
  return state.copyWith(
    status: NoteDetailsStatus.loadSuccess,
    data: state.data != null
        ? action.notes.firstOrNull((note) => note.id == state.data!.id)
        : null,
  );
}
