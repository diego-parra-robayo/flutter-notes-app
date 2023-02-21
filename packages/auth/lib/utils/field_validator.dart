import 'package:locale/generated/app_localizations.dart';

class FieldValidator {
  FieldValidator._();

  static const _emailRegExp =
      '^[A-Za-z0-9._%+\\-]+@[A-Za-z0-9.\\-]+\\.[A-Za-z]{2,4}\$';

  static String? notEmpty(
    String input, {
    required AppLocalizations l10n,
  }) {
    if (input.isEmpty) {
      return l10n.emptyFieldErrorMessage;
    }
    return null;
  }

  static String? isValidEmail(
    String input, {
    isRequired = true,
    required AppLocalizations l10n,
  }) {
    if (input.isEmpty) {
      return isRequired ? l10n.emptyFieldErrorMessage : null;
    } else if (!RegExp(_emailRegExp).hasMatch(input)) {
      return l10n.invalidEmailErrorMessage;
    }
    return null;
  }
}
