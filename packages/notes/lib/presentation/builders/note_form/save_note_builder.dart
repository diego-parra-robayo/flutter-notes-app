import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/note_form/note_form_bloc.dart';

class SaveNoteBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, void Function()? onPressed)
      builder;

  const SaveNoteBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previous, current) =>
          previous.isSaveButtonEnabled != current.isSaveButtonEnabled,
      builder: (context, state) => builder(
        context,
        !state.isSaveButtonEnabled ? null : () => _dispatchOnPressed(context),
      ),
    );
  }

  void _dispatchOnPressed(BuildContext context) =>
      context.read<NoteFormBloc>().add(NoteFormSaveButtonPressed());
}
