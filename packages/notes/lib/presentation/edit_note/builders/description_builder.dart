import 'package:core/bloc/bloc_text_builder.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/edit_note/bloc/edit_note_bloc.dart';

class DescriptionBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, TextEditingController controller)
      builder;

  const DescriptionBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocTextBuilder<EditNoteBloc, EditNoteEvent, EditNoteState>(
      converter: (state) => state.description,
      textChangedEventCreator: EditNoteDescriptionChanged.new,
      builder: builder,
    );
  }
}
