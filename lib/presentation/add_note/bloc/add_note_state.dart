part of 'add_note_bloc.dart';

@freezed
class AddNoteState with _$AddNoteState {
  factory AddNoteState({
    required bool isLoading,
    required String? popUpMessage,
    required String title,
    required String description,
    required AddNoteNavState? navState,
  }) = _AddNote;

  factory AddNoteState.initial() => AddNoteState(
        isLoading: false,
        popUpMessage: null,
        title: '',
        description: '',
        navState: null,
      );
}

extension AddNoteStateExtensions on AddNoteState {
  bool get isSaveButtonEnabled => title.isNotEmpty && description.isNotEmpty;
}
