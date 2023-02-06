import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/edit_note/bloc/edit_note_bloc.dart';

class SaveNoteBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, void Function()? onPressed)
      builder;

  const SaveNoteBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteBloc, EditNoteState>(
      buildWhen: (previous, current) =>
          previous.isSaveButtonEnabled != current.isSaveButtonEnabled,
      builder: (context, state) => builder(
        context,
        !state.isSaveButtonEnabled ? null : () => _dispatchOnPressed(context),
      ),
    );
  }

  void _dispatchOnPressed(BuildContext context) =>
      context.read<EditNoteBloc>().add(EditNoteSaveButtonPressed());
}
