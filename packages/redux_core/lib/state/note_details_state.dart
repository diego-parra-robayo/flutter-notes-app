import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_core/entities/failure.dart';

import '../entities/note.dart';

part 'note_details_state.freezed.dart';

@freezed
class NoteDetailsState with _$NoteDetailsState {
  factory NoteDetailsState({
    required NoteDetailsStatus status,
    required Note? data,
    required Failure? failure,
  }) = _NoteDetailsState;

  factory NoteDetailsState.initial() => NoteDetailsState(
        status: NoteDetailsStatus.idle,
        data: null,
        failure: null,
      );
}

enum NoteDetailsStatus { idle, loading, success, failure }
