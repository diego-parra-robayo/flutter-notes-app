import 'package:flutter/material.dart';
import 'package:ui/alerts/alert.dart';

class CustomSnackBar extends StatelessAlert {
  final String message;

  const CustomSnackBar({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(content: Text(message));
  }

  @override
  void show(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(build(context));
  }
}
