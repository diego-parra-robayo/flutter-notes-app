part of 'add_note_bloc.dart';

abstract class AddNoteEvent {}

class AddNoteTitleChanged extends AddNoteEvent {
  final String title;
  AddNoteTitleChanged(this.title);
}

class AddNoteDescriptionChanged extends AddNoteEvent {
  final String description;
  AddNoteDescriptionChanged(this.description);
}

class AddNoteSaveButtonPressed extends AddNoteEvent {}

class AddNoteNavEventHandled extends AddNoteEvent {}

class AddNotePopUpMessageShown extends AddNoteEvent {}
