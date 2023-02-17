import 'package:core/extensions/list_extensions.dart';
import 'package:redux_core/entities/entities.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/state/notes_state.dart';

bool selectNotesIsLoading(AppState state) =>
    state.notes.status == NotesStatus.loading;

List<Note> selectNotes(AppState state) => state.notes.data;

Note? selectNote(AppState state, String id) =>
    state.notes.data.firstOrNull((note) => note.id == id);

String? selectNotesPopUpMessage(AppState state) =>
    state.notes.status == NotesStatus.popUpFailure
        ? state.noteDetails.failure?.message
        : null;

String? selectNotesBreakingMessage(AppState state) =>
    state.notes.status == NotesStatus.breakingFailure
        ? state.noteDetails.failure?.message
        : null;
