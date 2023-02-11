import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';
import 'package:ui/extensions/snackbar.dart';

class NotesProvider extends StatelessWidget {
  final Widget child;

  const NotesProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  BlocProvider already added in homeNav/ShellRoute
    return MultiBlocListener(
      listeners: [_getPopUpMessageListener()],
      child: child,
    );
  }

  BlocListener _getPopUpMessageListener() {
    return BlocListener<NotesBloc, NotesState>(
      listenWhen: (previous, current) =>
          previous.popUpMessage != current.popUpMessage,
      listener: (context, state) {
        final popUpMessage = state.popUpMessage;
        if (popUpMessage == null) return;
        showSnackBar(context, message: popUpMessage);
        context.read<NotesBloc>().add(NotesPopUpMessageShown());
      },
    );
  }
}
