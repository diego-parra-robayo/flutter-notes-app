import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/utils/ui/components/custom_text_field.dart';

import '../bloc/edit_note_bloc.dart';

class TitleField extends StatelessWidget {
  const TitleField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditNoteBloc>();
    return CustomTextField(
      textStream: bloc.stream.map((state) => state.title),
      onTextChanged: (value) => bloc.add(EditNoteTitleChanged(value)),
      decoration: const InputDecoration(label: Text('Title')),
    );
  }
}