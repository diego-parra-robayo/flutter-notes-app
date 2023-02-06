import 'package:core/os/os.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';

void showConfirmDialog(
  BuildContext context, {
  String? title,
  String? description,
  String? confirmText,
  void Function()? onConfirm,
  String? cancelText,
  void Function()? onCancel,
}) {
  final titleWidget = title != null ? Text(title) : null;
  final contentWidget = description != null ? Text(description) : null;
  final textTheme = Theme.of(context).textTheme;
  final colorTheme = Theme.of(context).colorScheme;
  dismissDialogWithResult(bool result) =>
      Navigator.of(context, rootNavigator: true).pop(result);

  final actions = <Widget>[
    TextButton(
      onPressed: () {
        if (onCancel != null) onCancel();
        dismissDialogWithResult(false);
      },
      child: Text(
        cancelText ?? context.l10n.cancel,
        style: textTheme.labelLarge?.copyWith(color: colorTheme.error),
      ),
    ),
    TextButton(
      onPressed: () {
        if (onConfirm != null) onConfirm();
        dismissDialogWithResult(true);
      },
      child: Text(
        confirmText ?? context.l10n.confirm,
        style: textTheme.labelLarge?.copyWith(color: colorTheme.primary),
      ),
    ),
  ];

  if (OS.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: titleWidget,
        content: contentWidget,
        actions: actions,
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: titleWidget,
        content: contentWidget,
        actions: actions,
      ),
    );
  }
}
