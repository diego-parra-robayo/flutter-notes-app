import 'package:core/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/notes_routes.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';
import 'package:ui/extensions/custom_snackbar.dart';

import '../../blocs/note_form/note_form_bloc.dart';

class NoteFormProvider extends StatelessWidget {
  final String? noteId;
  final Widget child;

  const NoteFormProvider({
    Key? key,
    required this.noteId,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NoteFormBloc>()..add(NoteFormStarted(noteId: noteId)),
      child: MultiBlocListener(
        listeners: [
          _getResultListener(),
          _getPopUpMessageListener(),
        ],
        child: child,
      ),
    );
  }

  BlocListener _getResultListener() {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) => previous.result != current.result,
      listener: (context, state) {
        final bloc = context.read<NoteFormBloc>();
        final result = state.result;
        if (result == null) {
          return;
        } else if (result is NoteFormResultSuccess) {
          context.read<NotesBloc>().add(NotesStarted());
          bloc.add(NoteFormResultHandled());
          context.goNamed(NotesRoute.home);
        } else if (result is NoteFormResultFailure) {
          showSnackBar(context, message: result.message);
          bloc.add(NoteFormResultHandled());
        }
      },
    );
  }

  BlocListener _getPopUpMessageListener() {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.popUpMessage != current.popUpMessage,
      listener: (context, state) {
        final popUpMessage = state.popUpMessage;
        if (popUpMessage == null) return;
        showSnackBar(context, message: popUpMessage);
        context.read<NoteFormBloc>().add(NoteFormPopUpMessageShown());
      },
    );
  }
}
