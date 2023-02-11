part of 'notes_bloc.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required bool isLoading,
    required List<Note> notes,
    required String? errorMessage,
    required String? popUpMessage,
  }) = _NotesState;

  factory NotesState.initial() => NotesState(
        isLoading: false,
        notes: [],
        errorMessage: null,
        popUpMessage: null,
      );
}

extension NotesStateExtensions on NotesState {
  String? breakingMessage(AppLocalizations l10n) =>
      errorMessage ??
      ((notes.isEmpty && !isLoading) ? l10n.emptyNotesListMessage : null);
}
