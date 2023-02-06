import 'package:core/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';

class NotesListBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, NotesListUIModel model) builder;

  const NotesListBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
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
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;

  const NotesListUIModel({
    required this.notes,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
  });

  factory NotesListUIModel.fromState(HomeState state, BuildContext context) =>
      NotesListUIModel(
        notes: state.notes,
        onNotePressed: (note) =>
            _getBloc(context).add(HomeNotePressed(note.id)),
        onToggleCompleted: (id) =>
            _getBloc(context).add(HomeToggleCompletedPressed(noteId: id)),
        onDeleteNote: (id) => _getBloc(context)
            .add(HomeDeleteNotePressed(id, l10n: context.l10n)),
      );

  static HomeBloc _getBloc(BuildContext context) => context.read<HomeBloc>();
}