import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:reselect/reselect.dart';

import 'note.dart';
import 'notes_state.dart';

NotesState _selectNotesState(AppState state) => state.notes;

final NotesStatus Function(AppState) selectNotesStatus = createSelector1(
  _selectNotesState,
  (notesState) => notesState.status,
);

final bool Function(AppState) selectNotesIsLoading = createSelector1(
  _selectNotesState,
  (notesState) => notesState.status == NotesStatus.loading,
);

final Failure? Function(AppState) selectNotesPopUpFailure = createSelector1(
  _selectNotesState,
  (notesState) => notesState.status == NotesStatus.popUpFailure
      ? notesState.failure
      : null,
);

final Failure? Function(AppState) selectNotesBreakingFailure = createSelector1(
  _selectNotesState,
  (notesState) => notesState.status == NotesStatus.breakingFailure
      ? notesState.failure
      : null,
);

final List<Note> Function(AppState) selectNotes = createSelector2(
  (state) => _selectNotesState(state).noteIdList,
  (state) => _selectNotesState(state).notesById,
  (noteIds, notes) => noteIds.map((id) => notes[id]!).toList(),
);

final Note? Function(AppState) selectNoteDetails = createSelector2(
  (state) => _selectNotesState(state).noteIdDetails,
  (state) => _selectNotesState(state).notesById,
  (id, notes) => id == null ? null : notes[id],
);

final Map<String, Note> Function(AppState) selectNotesMap = createSelector1(
  _selectNotesState,
  (notesState) => notesState.notesById,
);
