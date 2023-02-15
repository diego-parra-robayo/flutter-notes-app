import 'package:flutter/material.dart';

import '../../../theme/ui.dart';
import 'confirm_delete_mixin.dart';

class NoteDeleteIcon extends StatelessWidget with ConfirmDeleteMixin {
  @override
  final void Function() onDeleteConfirmed;

  const NoteDeleteIcon({
    Key? key,
    required this.onDeleteConfirmed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => openConfirmDeleteDialog(context),
      icon: Icon(Icons.delete, color: UI.colors.red),
    );
  }
}