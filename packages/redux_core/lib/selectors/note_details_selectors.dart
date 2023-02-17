import 'package:redux_core/entities/entities.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/state/note_details_state.dart';

NoteDetailsStatus selectNoteDetailsStatus(AppState state) =>
    state.noteDetails.status;

bool selectNoteDetailsIsLoading(AppState state) =>
    state.noteDetails.status == NoteDetailsStatus.loading;

Note? selectNoteDetails(AppState state) => state.noteDetails.data;

String? selectNoteDetailsFailure(AppState state) =>
    state.noteDetails.status == NoteDetailsStatus.popUpFailure ||
            state.noteDetails.status == NoteDetailsStatus.breakingFailure
        ? state.noteDetails.failure?.message
        : null;
