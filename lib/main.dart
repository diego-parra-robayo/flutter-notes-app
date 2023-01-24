import 'package:core/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/home_nav.dart';
import 'package:todo/di/app_di.dart';
import 'package:ui/theme/ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppDi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Notes App',
      theme: UI.themes.light,
      routerConfig: GoRouter(
        routes: [homeNav],
      ),
    );
  }
}
