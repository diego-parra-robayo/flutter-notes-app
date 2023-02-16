import 'package:redux_core/entities/entities.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/state/notes_state.dart';

NotesStatus selectNotesStatus(AppState state) => state.notes.status;

bool selectNotesIsLoading(AppState state) =>
    state.notes.status == NotesStatus.loading;

List<Note> selectNotes(AppState state) => state.notes.data;

Failure? selectNotesFailure(AppState state) =>
    state.notes.status == NotesStatus.failure ? state.notes.failure : null;