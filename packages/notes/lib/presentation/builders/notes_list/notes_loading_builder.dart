import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';

class NotesLoadingBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  const NotesLoadingBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) => builder(context, state.isLoading),
    );
  }
}
