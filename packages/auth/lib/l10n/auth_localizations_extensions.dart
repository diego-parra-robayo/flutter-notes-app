import 'package:flutter/material.dart';

import 'auth_localizations.dart';

extension AuthLocalizationsX on BuildContext {
  AuthLocalizations get l10nAuth {
    final l10n = AuthLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}