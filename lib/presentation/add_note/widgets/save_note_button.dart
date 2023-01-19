import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/add_note/bloc/add_note_bloc.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteBloc, AddNoteState>(
      buildWhen: (previous, current) =>
          previous.isSaveButtonEnabled != current.isSaveButtonEnabled,
      builder: (context, state) => ElevatedButton(
        onPressed: !state.isSaveButtonEnabled
            ? null
            : () => context.read<AddNoteBloc>().add(AddNoteSaveButtonPressed()),
        child: const Text('Save'),
      ),
    );
  }
}
