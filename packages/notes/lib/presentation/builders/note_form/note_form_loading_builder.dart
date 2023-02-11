import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/blocs/note_form/note_form_bloc.dart';

class NoteFormLoadingBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  const NoteFormLoadingBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) => builder(context, state.isLoading),
    );
  }
}
