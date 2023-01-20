import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/utils/ui/components/note_widget.dart';

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
              return NoteWidget(
                note: note,
                onCompletedChanged: (_) => _dispatchToggleCompletedStatePressed(
                  context,
                  note.id,
                ),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          );
        });
  }

  void _dispatchToggleCompletedStatePressed(BuildContext context, String id) =>
      context.read<HomeBloc>().add(HomeToggleCompletedPressed(noteId: id));
}
