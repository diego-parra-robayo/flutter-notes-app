import 'package:freezed_annotation/freezed_annotation.dart';

import '../notes/notes_state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required NotesState notes,
  }) = _AppState;

  factory AppState.initial() => AppState(
        notes: NotesState.initial(),
      );
}
