import 'auth_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AuthLocalizationsEs extends AuthLocalizations {
  AuthLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get invalidEmailErrorMessage => 'Por favor ingresa un correo electrónico válido';
}
