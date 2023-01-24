part of 'edit_note_bloc.dart';

abstract class EditNoteEvent {}

class EditNoteStarted extends EditNoteEvent {
  final String? noteId;
  EditNoteStarted({required this.noteId});
}

class EditNoteTitleChanged extends EditNoteEvent {
  final String title;
  EditNoteTitleChanged(this.title);
}

class EditNoteDescriptionChanged extends EditNoteEvent {
  final String description;
  EditNoteDescriptionChanged(this.description);
}

class EditNoteSaveButtonPressed extends EditNoteEvent {}

class EditNoteNavEventHandled extends EditNoteEvent {}

class EditNotePopUpMessageShown extends EditNoteEvent {}
