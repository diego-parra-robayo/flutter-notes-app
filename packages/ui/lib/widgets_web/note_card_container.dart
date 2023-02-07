import 'package:flutter/material.dart';

import '../theme/ui.dart';

class NoteCardContainer extends StatelessWidget {
  final Color? cardColor;
  final double? borderRadius;
  final void Function() onPressed;
  final Widget child;

  const NoteCardContainer({
    Key? key,
    this.cardColor,
    this.borderRadius,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadiusWidget = borderRadius == null
        ? BorderRadius.circular(UI.dimens.d16)
        : borderRadius! == 0
            ? BorderRadius.zero
            : BorderRadius.circular(borderRadius!);

    return Card(
      color: cardColor ?? UI.colors.lightGray2,
      shape: RoundedRectangleBorder(borderRadius: borderRadiusWidget),
      child: InkWell(
        borderRadius: borderRadiusWidget,
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: UI.dimens.d16,
            horizontal: UI.dimens.d8,
          ),
          child: child,
        ),
      ),
    );
  }
}
