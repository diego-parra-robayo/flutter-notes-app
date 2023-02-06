import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/components/note_widget.dart';
import 'package:ui/extensions/dialog.dart';
import 'package:ui/theme/ui.dart';

import '../bloc/home_bloc.dart';

class HomeNotesList extends StatelessWidget {
  const HomeNotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.notes != current.notes,
        builder: (context, state) {
          final notes = state.notes;
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
                  onCheckChanged: (_) =>
                      _dispatchToggleCompletedStatePressed(context, note.id),
                  onPressed: (_) => _dispatchNotePressed(context, note.id),
                ),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          );
        });
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
        onConfirm: () => _dispatchDeleteNote(context, noteId),
      );
    } else {
      _dispatchToggleCompletedStatePressed(context, noteId);
    }
    return false;
  }

  void _dispatchToggleCompletedStatePressed(BuildContext context, String id) =>
      context.read<HomeBloc>().add(HomeToggleCompletedPressed(noteId: id));

  void _dispatchDeleteNote(BuildContext context, String id) => context
      .read<HomeBloc>()
      .add(HomeDeleteNotePressed(id, l10n: context.l10n));

  void _dispatchNotePressed(BuildContext context, String id) =>
      context.read<HomeBloc>().add(HomeNotePressed(id));
}
