import 'package:flutter/material.dart';
import 'package:notes/l10n/notes_localizations.dart';

extension NotesLocalizationsX on BuildContext {
  NotesLocalizations get l10nNotes {
    final l10n = NotesLocalizations.of(this);
    if (l10n != null) return l10n;
    throw Exception(
      'Did you forget to add this localization delegate to material app?',
    );
  }
}
