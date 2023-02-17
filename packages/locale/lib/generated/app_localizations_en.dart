import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Notes';

  @override
  String get save => 'Save';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

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
  String get nonEmptyValidationMessage => 'This field can\'t be empty';

  @override
  String get deleteNoteConfirmation => 'Are you sure you want to delete this note?';

  @override
  String get deletedNoteMessage => 'Note deleted';
}
