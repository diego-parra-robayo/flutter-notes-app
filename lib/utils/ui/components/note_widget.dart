import 'package:flutter/material.dart';

import '../../../domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final void Function(bool?) onCompletedChanged;

  const NoteWidget({
    Key? key,
    required this.note,
    required this.onCompletedChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        note.title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
            decoration: note.isCompleted ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(note.description),
      value: note.isCompleted,
      onChanged: onCompletedChanged,
    );
  }
}
