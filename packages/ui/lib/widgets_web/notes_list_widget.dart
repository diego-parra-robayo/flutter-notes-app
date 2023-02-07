import 'package:core/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:ui/widgets_web/note_card_container.dart';

import '../theme/ui.dart';
import 'note_widget.dart';

class NotesListWidget extends StatelessWidget {
  final List<Note> notes;
  final Future<void> Function() onRefresh;
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;
  final void Function() onAddNote;

  const NotesListWidget({
    Key? key,
    required this.notes,
    required this.onRefresh,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
    required this.onAddNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverPadding(
      padding: EdgeInsets.all(UI.dimens.d16),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width ~/ 300,
          mainAxisSpacing: UI.dimens.d16,
          crossAxisSpacing: UI.dimens.d16,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) {
          if (index == notes.length) {
            return NoteCardContainer(
              onPressed: onAddNote,
              child: const Icon(Icons.add),
            );
          }
          final note = notes[index];
          return NoteWidget(
            note: note,
            onCheckChanged: (_) => onToggleCompleted(note.id),
            onPressed: (_) => onNotePressed(note),
            onDeletePressed: onDeleteNote,
          );
        },
        itemCount: notes.length + 1,
      ),
    );
  }
}
