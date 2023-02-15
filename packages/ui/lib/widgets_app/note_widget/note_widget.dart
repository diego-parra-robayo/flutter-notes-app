import 'package:flutter/material.dart';
import 'package:redux_core/entities/entities.dart';
import 'package:ui/widgets_app/note_widget/note_delete/note_delete_icon.dart';
import 'package:ui/widgets_base/widget_connector.dart';

import '../../theme/ui.dart';
import 'note_container.dart';
import 'note_delete/note_delete_dismissible.dart';
import 'note_labels.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final void Function(Note note) onPressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeletePressed;
  final bool isDismissible;

  const NoteWidget({
    Key? key,
    required this.note,
    required this.onPressed,
    required this.onToggleCompleted,
    required this.onDeletePressed,
    required this.isDismissible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetConnector(
      isActive: isDismissible,
      parentBuilder: (context, child) => NoteDeleteDismissible(
        key: Key(note.id),
        onDeleteConfirmed: () => onDeletePressed(note.id),
        toggleCompleted: () => onToggleCompleted(note.id),
        child: child,
      ),
      child: NoteContainer(
        onPressed: () => onPressed(note),
        child: Row(
          children: [
            Checkbox(
              value: note.isCompleted,
              onChanged: (_) => onToggleCompleted(note.id),
            ),
            SizedBox(width: UI.dimens.d8),
            Expanded(
              child: NoteLabels(
                title: note.title,
                description: note.description,
                isCompleted: note.isCompleted,
              ),
            ),
            if (!isDismissible)
              NoteDeleteIcon(onDeleteConfirmed: () => onDeletePressed(note.id)),
          ],
        ),
      ),
    );
  }
}
