import 'package:core/os/os.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/home/builders/builders.dart';
import 'package:notes/presentation/home/screens/home_screen_mobile.dart';
import 'package:notes/presentation/home/screens/home_screen_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenBuilder(
      child: OS.isMobile ? const HomeScreenMobile() : const HomeScreenWeb(),
    );
  }
}
