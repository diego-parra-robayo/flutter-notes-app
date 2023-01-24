import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/components/loading_widget.dart';

import '../bloc/edit_note_bloc.dart';

class EditNoteLoadingWidget extends StatelessWidget {
  const EditNoteLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteBloc, EditNoteState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) =>
          state.isLoading ? const LoadingWidget() : const SizedBox.shrink(),
    );
  }
}