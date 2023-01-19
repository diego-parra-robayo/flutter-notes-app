import 'package:flutter/material.dart';

import '../../domain/entities/note.dart';

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
      value: note.isCompleted,
      onChanged: onCompletedChanged,
      title: Text(note.title),
      subtitle: Text(note.description),
    );
  }
}
