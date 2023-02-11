part of 'notes_bloc.dart';

abstract class NotesEvent {}

class NotesStarted extends NotesEvent {}

class NotesToggleNoteCompletedPressed extends NotesEvent {
  final String noteId;

  NotesToggleNoteCompletedPressed({
    required this.noteId,
  });
}

class NotesDeleteNotePressed extends NotesEvent {
  final String noteId;
  final AppLocalizations l10n;

  NotesDeleteNotePressed(
    this.noteId, {
    required this.l10n,
  });
}

class NotesPopUpMessageShown extends NotesEvent {}
