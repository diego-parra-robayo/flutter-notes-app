import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/alerts/alert.dart';
import 'package:ui/device_utils/device_utils.dart';

class ConfirmDialog extends StatelessAlert
    with OSDependentWidget, OSDependentAlert {
  final String? title;
  final String? description;
  final String? confirmText;
  final void Function()? onConfirm;
  final String? cancelText;
  final void Function()? onCancel;

  const ConfirmDialog({
    super.key,
    this.title,
    this.description,
    this.confirmText,
    this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAlertDialog(
      title: _titleWidget,
      content: _contentWidget,
      actions: _getActions(context),
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return AlertDialog(
      title: _titleWidget,
      content: _contentWidget,
      actions: _getActions(context),
    );
  }

  @override
  void showCupertino(BuildContext context) =>
      showCupertinoDialog(context: context, builder: buildCupertino);

  @override
  void showMaterial(BuildContext context) =>
      showDialog(context: context, builder: buildMaterial);
}

extension on ConfirmDialog {
  Widget? get _titleWidget => title != null ? Text(title!) : null;

  Widget? get _contentWidget => title != null ? Text(title!) : null;

  void _dismissDialogWithResult(BuildContext context, bool result) =>
      Navigator.of(context, rootNavigator: true).pop(result);

  List<Widget> _getActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return <Widget>[
      TextButton(
        onPressed: () {
          if (onCancel != null) onCancel!();
          _dismissDialogWithResult(context, false);
        },
        child: Text(
          cancelText ?? context.l10n.cancel,
          style: textTheme.labelLarge?.copyWith(color: colorTheme.error),
        ),
      ),
      TextButton(
        onPressed: () {
          if (onConfirm != null) onConfirm!();
          _dismissDialogWithResult(context, true);
        },
        child: Text(
          confirmText ?? context.l10n.confirm,
          style: textTheme.labelLarge?.copyWith(color: colorTheme.primary),
        ),
      ),
    ];
  }
}
