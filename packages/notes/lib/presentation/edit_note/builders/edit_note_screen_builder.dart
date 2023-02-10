import 'package:core/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/home_nav.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';
import 'package:ui/extensions/snackbar.dart';

import '../bloc/edit_note_bloc.dart';

class EditNoteScreenBuilder extends StatelessWidget {
  final String? noteId;
  final Widget child;

  const EditNoteScreenBuilder({
    Key? key,
    required this.noteId,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<EditNoteBloc>()..add(EditNoteStarted(noteId: noteId)),
      child: MultiBlocListener(
        listeners: [
          _getNavigationListener(),
          _getPopUpMessageListener(),
        ],
        child: child,
      ),
    );
  }

  BlocListener _getNavigationListener() {
    return BlocListener<EditNoteBloc, EditNoteState>(
      listenWhen: (previous, current) => previous.navState != current.navState,
      listener: (context, state) {
        final bloc = context.read<EditNoteBloc>();
        final navState = state.navState;
        switch (navState) {
          case null:
            return;
          case EditNoteNavState.popSuccess:
            context.read<HomeBloc>().add(HomeStarted());
            context.goNamed(HomeRoute.home);
            break;
        }
        bloc.add(EditNoteNavEventHandled());
      },
    );
  }

  BlocListener _getPopUpMessageListener() {
    return BlocListener<EditNoteBloc, EditNoteState>(
      listenWhen: (previous, current) =>
          previous.popUpMessage != current.popUpMessage,
      listener: (context, state) {
        final popUpMessage = state.popUpMessage;
        if (popUpMessage == null) return;
        showSnackBar(context, message: popUpMessage);
        context.read<EditNoteBloc>().add(EditNotePopUpMessageShown());
      },
    );
  }
}
