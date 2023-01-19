import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/add_note/bloc/add_note_bloc.dart';

class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteBloc, AddNoteState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) => TextField(
        decoration: const InputDecoration(label: Text('Title')),
        onChanged: (value) => context.read<AddNoteBloc>().add(
              AddNoteTitleChanged(value),
            ),
      ),
    );
  }
}
