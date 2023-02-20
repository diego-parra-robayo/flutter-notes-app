import 'package:freezed_annotation/freezed_annotation.dart';

import '../failure/failure.dart';
import 'note.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required NotesStatus status,
    required Failure? failure,
    required Map<String, Note> notesById,
    required List<String> noteIdList,
    required String? noteIdDetails,
  }) = _NotesState;

  factory NotesState.initial() => NotesState(
    status: NotesStatus.idle,
    failure: null,
    notesById: {},
    noteIdList: [],
    noteIdDetails: null,
  );
}

enum NotesStatus {
  idle,
  loading,
  loadSuccess,
  saveSuccess,
  popUpFailure,
  breakingFailure,
}