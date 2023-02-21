import 'package:core/l10n/core_localizations.dart';
import 'package:flutter/material.dart';

extension CoreLocalizationsX on BuildContext {
  CoreLocalizations get l10n {
    final l10n = CoreLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}