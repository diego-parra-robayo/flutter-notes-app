import 'package:flutter/material.dart';
import 'package:ui/device_utils/device_utils.dart';

import '../../theme/ui.dart';

class NoteContainer extends StatelessWidget with PlatformDependentWidget {
  final void Function() onPressed;
  final Widget child;

  const NoteContainer({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget buildMobile(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: UI.dimens.d16,
          horizontal: UI.dimens.d8,
        ),
        child: child,
      ),
    );
  }

  @override
  Widget buildWeb(BuildContext context) {
    final borderRadiusWidget = BorderRadius.circular(UI.dimens.d16);
    return Card(
      color: UI.colors.lightGray2,
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
