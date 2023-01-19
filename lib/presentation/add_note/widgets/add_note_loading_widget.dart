import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/add_note/bloc/add_note_bloc.dart';
import 'package:todo/utils/ui/components/loading_widget.dart';

class AddNoteLoadingWidget extends StatelessWidget {
  const AddNoteLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteBloc, AddNoteState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) =>
          state.isLoading ? const LoadingWidget() : const SizedBox.shrink(),
    );
  }
}
