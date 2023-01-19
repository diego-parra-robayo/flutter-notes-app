import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/add_note_bloc.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteBloc, AddNoteState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) => TextField(
        decoration: const InputDecoration(label: Text('Description')),
        onChanged: (value) => context.read<AddNoteBloc>().add(
              AddNoteDescriptionChanged(value),
            ),
      ),
    );
  }
}
