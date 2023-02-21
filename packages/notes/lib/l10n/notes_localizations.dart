import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'notes_localizations_en.dart';
import 'notes_localizations_es.dart';

/// Callers can lookup localized strings with an instance of NotesLocalizations
/// returned by `NotesLocalizations.of(context)`.
///
/// Applications need to include `NotesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/notes_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NotesLocalizations.localizationsDelegates,
///   supportedLocales: NotesLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the NotesLocalizations.supportedLocales
/// property.
abstract class NotesLocalizations {
  NotesLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NotesLocalizations? of(BuildContext context) {
    return Localizations.of<NotesLocalizations>(context, NotesLocalizations);
  }

  static const LocalizationsDelegate<NotesLocalizations> delegate = _NotesLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @emptyNotesListMessage.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created a note yet.'**
  String get emptyNotesListMessage;

  /// No description provided for @createNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Create new note'**
  String get createNoteTitle;

  /// No description provided for @editNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get editNoteTitle;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @deleteNoteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this note?'**
  String get deleteNoteConfirmation;

  /// No description provided for @deletedNoteMessage.
  ///
  /// In en, this message translates to:
  /// **'Note deleted'**
  String get deletedNoteMessage;
}

class _NotesLocalizationsDelegate extends LocalizationsDelegate<NotesLocalizations> {
  const _NotesLocalizationsDelegate();

  @override
  Future<NotesLocalizations> load(Locale locale) {
    return SynchronousFuture<NotesLocalizations>(lookupNotesLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_NotesLocalizationsDelegate old) => false;
}

NotesLocalizations lookupNotesLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return NotesLocalizationsEn();
    case 'es': return NotesLocalizationsEs();
  }

  throw FlutterError(
    'NotesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
