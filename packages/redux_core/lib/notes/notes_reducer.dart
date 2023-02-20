import 'package:redux/redux.dart';

import '../utils/action.dart';
import 'note.dart';
import 'notes_actions.dart';
import 'notes_state.dart';

final Reducer<NotesState> notesReducer = combineReducers([
  TypedReducer<NotesState, SetNotesLoadingAction>(_setNotesLoading),
  TypedReducer<NotesState, SetNotesFailureAction>(_setNotesFailure),
  TypedReducer<NotesState, SetNotesAction>(_setNotes),
  TypedReducer<NotesState, SetNoteDetailsAction>(_setNoteDetails),
  TypedReducer<NotesState, Action>(_saveNote),
  TypedReducer<NotesState, DeleteNoteAction>(_deleteNote),
  TypedReducer<NotesState, ClearNotesAction>(_clearNotes),
]);

NotesState _setNotesLoading(NotesState state, SetNotesLoadingAction action) {
  return state.copyWith(status: NotesStatus.loading);
}

NotesState _setNotesFailure(NotesState state, SetNotesFailureAction action) {
  return state.copyWith(
    status: action.isBreakingFailure
        ? NotesStatus.breakingFailure
        : NotesStatus.popUpFailure,
    failure: action.failure,
  );
}

NotesState _setNotes(NotesState state, SetNotesAction action) {
  final noteIdList = <String>[];
  final notesById = Map.of(state.notesById);
  for (final note in action.notes) {
    noteIdList.add(note.id);
    notesById[note.id] = note;
  }
  return state.copyWith(
    status: NotesStatus.loadSuccess,
    noteIdList: noteIdList,
    notesById: notesById,
  );
}

NotesState _setNoteDetails(NotesState state, SetNoteDetailsAction action) {
  final Map<String, Note> notesById;
  if (action.note != null) {
    notesById = Map.of(state.notesById);
    notesById[action.note!.id] = action.note!;
  } else {
    notesById = state.notesById;
  }

  return state.copyWith(
    status: NotesStatus.loadSuccess,
    noteIdDetails: action.note?.id,
    notesById: notesById,
  );
}

NotesState _saveNote(NotesState state, Action action) {
  if (action is AddNoteAction || action is UpdateNoteAction) {
    final note = action is AddNoteAction
        ? action.newNote
        : (action as UpdateNoteAction).updatedNote;
    final notesById = Map.of(state.notesById);
    notesById[note.id] = note;
    return state.copyWith(
      status: NotesStatus.saveSuccess,
      notesById: notesById,
      noteIdDetails: note.id,
      noteIdList: action is AddNoteAction
          ? [...state.noteIdList, note.id]
          : state.noteIdList,
    );
  }
  return state;
}

NotesState _deleteNote(NotesState state, DeleteNoteAction action) {
  final notesById = Map.of(state.notesById);
  notesById.remove(action.id);
  final noteIdList = List.of(state.noteIdList);
  noteIdList.removeWhere((id) => id == action.id);
  return state.copyWith(
    status: NotesStatus.saveSuccess,
    notesById: notesById,
    noteIdList: noteIdList,
    noteIdDetails:
        state.noteIdDetails == action.id ? null : state.noteIdDetails,
  );
}

NotesState _clearNotes(NotesState state, ClearNotesAction action) {
  return state.copyWith(
    status: NotesStatus.saveSuccess,
    notesById: {},
    noteIdList: [],
    noteIdDetails: null,
    failure: null,
  );
}
