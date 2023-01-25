import 'package:core/shared_entities/note.dart';
import 'package:flutter/material.dart';

import '../theme/ui.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final void Function(bool?) onCheckChanged;
  final void Function(String id) onPressed;

  const NoteWidget({
    Key? key,
    required this.note,
    required this.onCheckChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => onPressed(note.id),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: UI.dimens.d16,
          horizontal: UI.dimens.d8,
        ),
        child: Row(
          children: [
            Checkbox(value: note.isCompleted, onChanged: onCheckChanged),
            SizedBox(width: UI.dimens.d8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    note.title,
                    style: textTheme.titleMedium?.copyWith(
                        decoration: note.isCompleted
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  SizedBox(height: UI.dimens.d8),
                  Text(
                    note.description,
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
