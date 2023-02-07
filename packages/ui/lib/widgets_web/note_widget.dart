import 'package:core/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/widgets_web/note_card_container.dart';

import '../extensions/dialog.dart';
import '../theme/ui.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final void Function(String id) onPressed;
  final void Function(bool?) onCheckChanged;
  final void Function(String id) onDeletePressed;

  const NoteWidget({
    Key? key,
    required this.note,
    required this.onPressed,
    required this.onCheckChanged,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return NoteCardContainer(
      onPressed: () => onPressed(note.id),
      child: Row(
        children: [
          Checkbox(
            value: note.isCompleted,
            onChanged: onCheckChanged,
          ),
          SizedBox(width: UI.dimens.d8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  note.title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                      decoration: note.isCompleted
                          ? TextDecoration.lineThrough
                          : null),
                ),
                SizedBox(height: UI.dimens.d8),
                Text(
                  note.description,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          SizedBox(width: UI.dimens.d8),
          IconButton(
            onPressed: () => _confirmDelete(context),
            icon: Icon(Icons.delete, color: UI.colors.red),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showConfirmDialog(
      context,
      description: context.l10n.deleteNoteConfirmation,
      onConfirm: () => onDeletePressed(note.id),
    );
  }
}