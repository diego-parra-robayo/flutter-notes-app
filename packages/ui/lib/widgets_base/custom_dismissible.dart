import 'package:flutter/material.dart';

import '../theme/ui.dart';

class CustomDismissible extends StatelessWidget {
  final void Function()? onSwipeLeft;
  final Icon? onSwipeLeftIcon;
  final Color? onSwipeLeftColor;
  final void Function()? onSwipeRight;
  final Icon? onSwipeRightIcon;
  final Color? onSwipeRightColor;
  final Widget child;

  const CustomDismissible({
    required Key key,
    this.onSwipeLeft,
    this.onSwipeLeftIcon,
    this.onSwipeLeftColor,
    this.onSwipeRight,
    this.onSwipeRightIcon,
    this.onSwipeRightColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      confirmDismiss: (direction) => _confirmDismiss(direction),
      background: Container(
        color: onSwipeRightColor ?? onSwipeLeftColor,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(UI.dimens.d16),
        child: onSwipeRightIcon,
      ),
      secondaryBackground: Container(
        color: onSwipeLeftColor ?? onSwipeRightColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(UI.dimens.d16),
        child: onSwipeLeftIcon,
      ),
      child: child,
    );
  }

  Future<bool> _confirmDismiss(DismissDirection direction) async {
    if (direction == DismissDirection.endToStart && onSwipeLeft != null) {
      onSwipeLeft!();
    } else if (direction == DismissDirection.startToEnd &&
        onSwipeRight != null) {
      onSwipeRight!();
    }
    return false;
  }
}
