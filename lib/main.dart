import 'package:flutter/material.dart';
import 'package:todo/di/app_di.dart';
import 'package:todo/presentation/home/widgets/home_screen.dart';

void main() {
  AppDi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
