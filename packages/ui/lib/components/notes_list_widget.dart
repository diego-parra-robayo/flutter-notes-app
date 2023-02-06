import 'package:core/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';

import '../extensions/dialog.dart';
import '../theme/ui.dart';
import 'note_widget.dart';

class NotesListWidget extends StatelessWidget {
  final List<Note> notes;
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;

  const NotesListWidget({
    Key? key,
    required this.notes,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Dismissible(
          key: Key(note.id),
          confirmDismiss: (direction) =>
              _confirmDismiss(direction, context, note.id),
          background: Container(
            color: UI.colors.green,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(UI.dimens.d16),
            child: Icon(Icons.check, color: UI.colors.white),
          ),
          secondaryBackground: Container(
            color: UI.colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(UI.dimens.d16),
            child: Icon(Icons.delete, color: UI.colors.white),
          ),
          child: NoteWidget(
            note: note,
            onCheckChanged: (_) => onToggleCompleted(note.id),
            onPressed: (_) => onNotePressed(note),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  Future<bool> _confirmDismiss(
    DismissDirection direction,
    BuildContext context,
    String noteId,
  ) async {
    if (direction == DismissDirection.endToStart) {
      showConfirmDialog(
        context,
        description: context.l10n.deleteNoteConfirmation,
        onConfirm: () => onDeleteNote(noteId),
      );
    } else {
      onToggleCompleted(noteId);
    }
    return false;
  }
}
