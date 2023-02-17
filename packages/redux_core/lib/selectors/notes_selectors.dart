import 'package:core/extensions/list_extensions.dart';
import 'package:redux_core/redux_core.dart';

bool selectNotesIsLoading(AppState state) =>
    state.notes.status == NotesStatus.loading ||
    state.noteDetails.status == NoteDetailsStatus.loading;

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
