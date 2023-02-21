import 'core_localizations.dart';

/// The translations for English (`en`).
class CoreLocalizationsEn extends CoreLocalizations {
  CoreLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Notes';

  @override
  String get save => 'Save';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get emptyFieldErrorMessage => 'This field can\'t be empty';

  @override
  String get notAuthenticatedFailureMessage => 'Please sign in to access this feature';

  @override
  String get notFoundFailureMessage => 'Element was not found';

  @override
  String get deleteNoteConfirmation => 'Are you sure you want to delete this note?';
}
