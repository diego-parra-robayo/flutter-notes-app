import 'package:auth/l10n/auth_localizations.dart';
import 'package:core/l10n/core_localizations.dart';
import 'package:flutter/material.dart';
import 'package:notes/l10n/notes_localizations.dart';

class AppLocalizations {
  AppLocalizations._();

  static const Iterable<LocalizationsDelegate> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    CoreLocalizations.delegate,
    AuthLocalizations.delegate,
    NotesLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];
}
