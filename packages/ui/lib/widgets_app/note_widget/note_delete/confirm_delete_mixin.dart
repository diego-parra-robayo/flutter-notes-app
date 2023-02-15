import 'package:flutter/cupertino.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';

import '../../../alerts/confirm_dialog.dart';

mixin ConfirmDeleteMixin {
  void Function() get onDeleteConfirmed;

  void openConfirmDeleteDialog(BuildContext context) {
    ConfirmDialog(
      description: context.l10n.deleteNoteConfirmation,
      onConfirm: onDeleteConfirmed,
    ).show(context);
  }
}