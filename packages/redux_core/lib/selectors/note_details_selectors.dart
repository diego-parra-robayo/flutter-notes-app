import 'package:redux_core/entities/entities.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/state/note_details_state.dart';

NoteDetailsStatus selectNoteDetailsStatus(AppState state) =>
    state.noteDetails.status;

bool selectNoteDetailsIsLoading(AppState state) =>
    state.noteDetails.status == NoteDetailsStatus.loading;

Note? selectNoteDetails(AppState state) => state.noteDetails.data;

Failure? _selectNoteDetailsFailure(AppState state) =>
    state.noteDetails.status == NoteDetailsStatus.failure
        ? state.noteDetails.failure
        : null;

String? selectNoteDetailsPopUpMessage(AppState state) {
  final failure = _selectNoteDetailsFailure(state);
  if (failure?.type == FailureType.popUpMessage) {
    return failure?.message;
  }
  return null;
}
