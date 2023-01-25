import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/l10n/app_localizations_extensions.dart';

import '../bloc/edit_note_bloc.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteBloc, EditNoteState>(
      buildWhen: (previous, current) =>
          previous.isSaveButtonEnabled != current.isSaveButtonEnabled,
      builder: (context, state) => ElevatedButton(
        onPressed: !state.isSaveButtonEnabled
            ? null
            : () =>
                context.read<EditNoteBloc>().add(EditNoteSaveButtonPressed()),
        child: Text(context.l10n.save),
      ),
    );
  }
}
