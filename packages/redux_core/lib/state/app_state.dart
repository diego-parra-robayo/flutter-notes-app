import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_core/state/note_details_state.dart';
import 'package:redux_core/state/notes_state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required NotesState notes,
    required NoteDetailsState noteDetails,
  }) = _AppState;

  factory AppState.initial() => AppState(
        notes: NotesState.initial(),
        noteDetails: NoteDetailsState.initial(),
      );
}
