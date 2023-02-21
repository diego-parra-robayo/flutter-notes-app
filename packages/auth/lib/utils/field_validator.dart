import 'package:auth/l10n/auth_localizations_extensions.dart';
import 'package:core/l10n/core_localizations_extensions.dart';
import 'package:flutter/cupertino.dart';

class FieldValidator {
  FieldValidator._();

  static const _emailRegExp =
      '^[A-Za-z0-9._%+\\-]+@[A-Za-z0-9.\\-]+\\.[A-Za-z]{2,4}\$';

  static String? notEmpty(
    String input, {
    required BuildContext context,
  }) {
    if (input.isEmpty) {
      return context.l10n.emptyFieldErrorMessage;
    }
    return null;
  }

  static String? isValidEmail(
    String input, {
    isRequired = true,
    required BuildContext context,
  }) {
    if (input.isEmpty) {
      return isRequired ? context.l10n.emptyFieldErrorMessage : null;
    } else if (!RegExp(_emailRegExp).hasMatch(input)) {
      return context.l10nAuth.invalidEmailErrorMessage;
    }
    return null;
  }
}
