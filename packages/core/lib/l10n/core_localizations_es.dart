import 'core_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class CoreLocalizationsEs extends CoreLocalizations {
  CoreLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Notas';

  @override
  String get save => 'Guardar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get emptyFieldErrorMessage => 'Este campo no puede estar vacío';

  @override
  String get notAuthenticatedFailureMessage => 'Por favor inicia sesión para acceder a esta funcionalidad';

  @override
  String get notFoundFailureMessage => 'Elemento no encontrado';

  @override
  String get deleteNoteConfirmation => '¿Seguro deseas eliminar esta nota?';
}
