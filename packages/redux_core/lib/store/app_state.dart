import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_core/auth/auth_state.dart';

import '../notes/notes_state.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required AuthState auth,
    required NotesState notes,
  }) = _AppState;

  factory AppState.initial() => AppState(
        auth: AuthState.initial(),
        notes: NotesState.initial(),
      );
}
