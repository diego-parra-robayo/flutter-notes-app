import 'package:core/bloc/bloc_text_builder.dart';
import 'package:flutter/material.dart';

import '../../blocs/note_form/note_form_bloc.dart';

class NoteTitleFieldBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, TextEditingController controller)
  builder;

  const NoteTitleFieldBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocTextBuilder<NoteFormBloc, NoteFormEvent, NoteFormState>(
      converter: (state) => state.title,
      textChangedEventCreator: NoteFormTitleChanged.new,
      builder: builder,
    );
  }
}

class NoteDescriptionFieldBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, TextEditingController controller)
  builder;

  const NoteDescriptionFieldBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocTextBuilder<NoteFormBloc, NoteFormEvent, NoteFormState>(
      converter: (state) => state.description,
      textChangedEventCreator: NoteFormDescriptionChanged.new,
      builder: builder,
    );
  }
}
