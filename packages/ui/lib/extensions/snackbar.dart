import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  final snackBar = SnackBar(content: Text(message));
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.hideCurrentSnackBar();
  scaffoldMessenger.showSnackBar(snackBar);
}
