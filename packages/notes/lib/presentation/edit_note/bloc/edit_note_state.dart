part of 'edit_note_bloc.dart';

@freezed
class EditNoteState with _$EditNoteState {
  factory EditNoteState({
    required bool isLoading,
    required String? popUpMessage,
    required String? noteId,
    required String title,
    required String description,
    required EditNoteNavState? navState,
  }) = _EditNoteState;

  factory EditNoteState.initial() => EditNoteState(
        isLoading: false,
        popUpMessage: null,
        noteId: null,
        title: '',
        description: '',
        navState: null,
      );
}

extension EditNoteStateExtensions on EditNoteState {
  bool get isSaveButtonEnabled =>
      !isLoading && title.isNotEmpty && description.isNotEmpty;
}
