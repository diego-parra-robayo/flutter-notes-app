import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/components/custom_text_field.dart';

import '../bloc/edit_note_bloc.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditNoteBloc>();
    return CustomTextField(
      textStream: bloc.stream.map((state) => state.description),
      onTextChanged: (value) => bloc.add(EditNoteDescriptionChanged(value)),
      decoration: const InputDecoration(label: Text('Description')),
    );
  }
}
