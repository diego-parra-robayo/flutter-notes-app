import 'package:core/l10n/core_localizations_extensions.dart';
import 'package:flutter/material.dart';
import 'package:redux_core/redux_core.dart';
import 'package:todo/app/app_router.dart';
import 'package:todo/app/app_store.dart';
import 'package:ui/theme/ui.dart';

import 'app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp.router(
        onGenerateTitle: (context) => context.l10n.appName,
        theme: UI.themes.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: appRouter,
      ),
    );
  }
}
