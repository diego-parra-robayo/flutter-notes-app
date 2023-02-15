import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/failure.dart';
import '../entities/note.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required NotesStatus status,
    required List<Note> data,
    required Failure? failure,
  }) = _NotesState;

  factory NotesState.initial() => NotesState(
        status: NotesStatus.idle,
        data: [],
        failure: null,
      );
}

enum NotesStatus { idle, loading, success, failure }
