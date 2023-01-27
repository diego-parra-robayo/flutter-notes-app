import 'package:core/shared_entities/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/navigation/home_nav.dart';
import 'package:ui/components/note_widget.dart';
import 'package:ui/extensions/dialog.dart';
import 'package:ui/l10n/app_localizations_extensions.dart';
import 'package:ui/theme/ui.dart';

class HomeNotesList extends ConsumerWidget {
  final List<Note> notes;

  const HomeNotesList({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return Dismissible(
          key: Key(note.id),
          confirmDismiss: (direction) => _confirmDismiss(
            direction,
            context,
            ref,
            note.id,
          ),
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
            onCheckChanged: (_) =>
                _dispatchToggleCompletedStatePressed(ref, note.id),
            onPressed: (_) => _dispatchNotePressed(context, note.id),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  Future<bool> _confirmDismiss(
    DismissDirection direction,
    BuildContext context,
    WidgetRef ref,
    String noteId,
  ) async {
    if (direction == DismissDirection.endToStart) {
      showConfirmDialog(
        context,
        description: context.l10n.deleteNoteConfirmation,
        onConfirm: () => _dispatchDeleteNote(ref, noteId),
      );
    } else {
      _dispatchToggleCompletedStatePressed(ref, noteId);
    }
    return false;
  }

  void _dispatchToggleCompletedStatePressed(WidgetRef ref, String id) =>
      ref.read(notesProvider.notifier).toggleCompletedState(id);

  void _dispatchDeleteNote(WidgetRef ref, String id) =>
      ref.read(notesProvider.notifier).deleteNote(id);

  void _dispatchNotePressed(BuildContext context, String id) =>
      context.goNamed(HomeRoute.editNote.name, params: {'id': id});
}
