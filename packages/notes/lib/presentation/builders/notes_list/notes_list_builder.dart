import 'package:core/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';

import '../../../navigation/notes_routes.dart';

class NotesListBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, NotesListUIModel model) builder;

  const NotesListBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      buildWhen: (previous, current) => previous.notes != current.notes,
      builder: (context, state) => builder(
        context,
        NotesListUIModel.fromState(state, context),
      ),
    );
  }
}

class NotesListUIModel {
  final List<Note> notes;
  final Future<void> Function() onRefresh;
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;
  final void Function() onAddNote;

  const NotesListUIModel({
    required this.notes,
    required this.onRefresh,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
    required this.onAddNote,
  });

  factory NotesListUIModel.fromState(NotesState state, BuildContext context) =>
      NotesListUIModel(
        notes: state.notes,
        onRefresh: () async {
          _getBloc(context).add(NotesStarted());
          return;
        },
        onNotePressed: (note) => context.goNamed(
          NotesRoute.editNote,
          params: {'id': note.id},
        ),
        onToggleCompleted: (id) =>
            _getBloc(context).add(NotesToggleNoteCompletedPressed(noteId: id)),
        onDeleteNote: (id) => _getBloc(context)
            .add(NotesDeleteNotePressed(id, l10n: context.l10n)),
        onAddNote: () => context.goNamed(NotesRoute.addNote),
      );

  static NotesBloc _getBloc(BuildContext context) => context.read<NotesBloc>();
}
