import 'package:core/extensions/list_extensions.dart';
import 'package:redux/redux.dart';
import 'package:redux_core/actions/action.dart';
import 'package:redux_core/actions/note_details_action.dart';
import 'package:redux_core/actions/notes_actions.dart';
import 'package:redux_core/state/notes_state.dart';

///   Common implementation of a reducer
NotesState notesReducer(NotesState state, Action action) {
  if (action is SetNotesLoadingAction) {
    return state.copyWith(
      status: NotesStatus.loading,
    );
  } else if (action is SetNotesFailureAction) {
    return state.copyWith(
      status: action.isBreakingFailure
          ? NotesStatus.breakingFailure
          : NotesStatus.popUpFailure,
      failure: action.failure,
    );
  } else if (action is SetNotesAction) {
    return state.copyWith(
      status: NotesStatus.success,
      data: action.notes,
    );
  } else if (action is AddNoteAction) {
    return state.copyWith(
      status: NotesStatus.success,
      data: [
        ...state.data,
        action.newNote,
      ],
    );
  } else if (action is UpdateNoteAction) {
    return state.copyWith(
      status: NotesStatus.success,
      data: state.data.findAndReplace(
        find: (item) => item.id == action.updatedNote.id,
        replace: (_) => action.updatedNote,
      ),
    );
  } else if (action is DeleteNoteAction) {
    final notes = List.of(state.data);
    notes.removeWhere((note) => note.id == action.id);
    return state.copyWith(
      status: NotesStatus.success,
      data: notes,
    );
  } else if (action is SetNoteDetailsAction) {
    return state.copyWith(
      status: NotesStatus.success,
      data: action.note != null
          ? state.data.findAndReplace(
              find: (item) => item.id == action.note!.id,
              replace: (_) => action.note!,
            )
          : state.data,
    );
  }
  return state;
}

///   Same reducer as notesReducer, but somewhat more readable.
///   It is clear which actions are being handled by this reducer
final Reducer<NotesState> notesReducer2 = combineReducers([
  TypedReducer<NotesState, SetNotesLoadingAction>(_setNotesLoading),
  TypedReducer<NotesState, SetNotesFailureAction>(_setNotesFailure),
  TypedReducer<NotesState, SetNotesAction>(_setNotes),
  TypedReducer<NotesState, AddNoteAction>(_addNote),
  TypedReducer<NotesState, UpdateNoteAction>(_updateNote),
  TypedReducer<NotesState, DeleteNoteAction>(_deleteNote),
  TypedReducer<NotesState, SetNoteDetailsAction>(_setNoteDetails),
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
  return state.copyWith(
    status: NotesStatus.success,
    data: action.notes,
  );
}

NotesState _addNote(NotesState state, AddNoteAction action) {
  return state.copyWith(
    status: NotesStatus.success,
    data: [
      ...state.data,
      action.newNote,
    ],
  );
}

NotesState _updateNote(NotesState state, UpdateNoteAction action) {
  return state.copyWith(
    status: NotesStatus.success,
    data: state.data.findAndReplace(
      find: (item) => item.id == action.updatedNote.id,
      replace: (_) => action.updatedNote,
    ),
  );
}

NotesState _deleteNote(NotesState state, DeleteNoteAction action) {
  final notes = List.of(state.data);
  notes.removeWhere((note) => note.id == action.id);
  return state.copyWith(
    status: NotesStatus.success,
    data: notes,
  );
}

NotesState _setNoteDetails(NotesState state, SetNoteDetailsAction action) {
  return state.copyWith(
    status: NotesStatus.success,
    data: action.note != null
        ? state.data.findAndReplace(
            find: (item) => item.id == action.note!.id,
            replace: (_) => action.note!,
          )
        : state.data,
  );
}
