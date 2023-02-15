import 'package:flutter/material.dart';

import '../../../theme/ui.dart';
import '../../../widgets_base/custom_dismissible.dart';
import 'confirm_delete_mixin.dart';

class NoteDeleteDismissible extends StatelessWidget with ConfirmDeleteMixin {
  @override
  final void Function() onDeleteConfirmed;

  final void Function() toggleCompleted;

  final Widget child;

  const NoteDeleteDismissible({
    required Key key,
    required this.onDeleteConfirmed,
    required this.toggleCompleted,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDismissible(
      key: key!,
      onSwipeLeft: () => openConfirmDeleteDialog(context),
      onSwipeLeftColor: UI.colors.red,
      onSwipeLeftIcon: Icon(Icons.delete, color: UI.colors.white),
      onSwipeRight: toggleCompleted,
      onSwipeRightColor: UI.colors.green,
      onSwipeRightIcon: Icon(Icons.check, color: UI.colors.white),
      child: child,
    );
  }
}
