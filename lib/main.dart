import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/di/app_di.dart';
import 'package:todo/navigation/home_nav.dart';

void main() {
  AppDi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HomeRoute.initialRoute.name,
      getPages: [homeNav],
      defaultTransition: Platform.isAndroid ? Transition.noTransition : null,
    );
  }
}
