import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Notas';

  @override
  String get save => 'Guardar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get emptyNotesListMessage => 'Aún no has creado ninguna nota.';

  @override
  String get createNoteTitle => 'Crear una nota';

  @override
  String get editNoteTitle => 'Editar nota';

  @override
  String get title => 'Título';

  @override
  String get description => 'Descripción';

  @override
  String get deleteNoteConfirmation => '¿Seguro deseas eliminar esta nota?';

  @override
  String get deletedNoteMessage => 'Nota eliminada';
}
