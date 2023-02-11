import 'package:core/os/os.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/builders/builders.dart';
import 'package:notes/presentation/screens/home/home_screen_web.dart';

import 'home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotesProvider(
      child: OS.isMobile ? const HomeScreenMobile() : const HomeScreenWeb(),
    );
  }
}
