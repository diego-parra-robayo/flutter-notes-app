import 'notes_localizations.dart';

/// The translations for English (`en`).
class NotesLocalizationsEn extends NotesLocalizations {
  NotesLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emptyNotesListMessage => 'You haven\'t created a note yet.';

  @override
  String get createNoteTitle => 'Create new note';

  @override
  String get editNoteTitle => 'Edit note';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get deleteNoteConfirmation => 'Are you sure you want to delete this note?';

  @override
  String get deletedNoteMessage => 'Note deleted';
}
