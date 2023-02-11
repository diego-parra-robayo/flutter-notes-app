part of 'note_form_bloc.dart';

abstract class NoteFormEvent {}

class NoteFormStarted extends NoteFormEvent {
  final String? noteId;
  NoteFormStarted({required this.noteId});
}

class NoteFormTitleChanged extends NoteFormEvent {
  final String title;
  NoteFormTitleChanged(this.title);
}

class NoteFormDescriptionChanged extends NoteFormEvent {
  final String description;
  NoteFormDescriptionChanged(this.description);
}

class NoteFormSaveButtonPressed extends NoteFormEvent {}

class NoteFormPopUpMessageShown extends NoteFormEvent {}

class NoteFormResultHandled extends NoteFormEvent {}
