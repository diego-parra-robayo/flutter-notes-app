import 'package:flutter/material.dart';

///   Places a widget in between a parent and its child if certain condition (isActive) is met.
class WidgetConnector extends StatelessWidget {
  final bool isActive;
  final Widget Function(BuildContext context, Widget child) parentBuilder;
  final Widget child;

  const WidgetConnector({
    Key? key,
    required this.isActive,
    required this.parentBuilder,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return parentBuilder(context, child);
    } else {
      return child;
    }
  }
}
