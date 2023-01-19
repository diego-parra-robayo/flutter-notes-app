import 'package:flutter/material.dart';
import 'package:todo/utils/ui/theme/ui.dart';

class NotesThemes {
  final light = _lightTheme;
}

final _lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light(
    primary: UI.colors.blue,
    error: UI.colors.red,
    background: UI.colors.background,
    secondary: UI.colors.blue,
  ),
  scaffoldBackgroundColor: UI.colors.background,
);
