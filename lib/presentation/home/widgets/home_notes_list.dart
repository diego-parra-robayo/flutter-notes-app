import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/utils/ui/components/note_widget.dart';
import 'package:todo/utils/ui/dialog.dart';
import 'package:todo/utils/ui/theme/ui.dart';

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
                  onCompletedChanged: (_) =>
                      _dispatchToggleCompletedStatePressed(
                    context,
                    note.id,
                  ),
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
        description: 'Are you sure you want to delete this note?',
        onConfirm: () => _dispatchDeleteNote(context, noteId),
      );
    } else {
      _dispatchToggleCompletedStatePressed(context, noteId);
    }
    return false;
  }

  void _dispatchToggleCompletedStatePressed(BuildContext context, String id) =>
      context.read<HomeBloc>().add(HomeToggleCompletedPressed(noteId: id));

  void _dispatchDeleteNote(BuildContext context, String id) =>
      context.read<HomeBloc>().add(HomeDeleteNotePressed(id));
}
