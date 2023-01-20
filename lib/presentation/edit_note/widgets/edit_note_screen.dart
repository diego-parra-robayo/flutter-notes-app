import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/edit_note/widgets/save_note_button.dart';
import 'package:todo/presentation/edit_note/widgets/title_field.dart';
import 'package:todo/utils/ui/theme/ui.dart';

import '../../../di/app_di.dart';
import '../../../utils/ui/snackbar.dart';
import '../bloc/edit_note_bloc.dart';
import 'description_field.dart';
import 'edit_note_loading_widget.dart';

class EditNoteScreen extends StatelessWidget {
  final String? noteId;
  final void Function()? onEditSuccess;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
    this.onEditSuccess,
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
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              noteId == null ? 'Create new note' : 'Edit note',
            ),
          ),
          body: Stack(
            children: [
              const EditNoteLoadingWidget(),
              Padding(
                padding: EdgeInsets.all(UI.dimens.d16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TitleField(),
                    SizedBox(height: UI.dimens.d16),
                    const Expanded(child: DescriptionField()),
                    SizedBox(height: UI.dimens.d16),
                    const SaveNoteButton(),
                  ],
                ),
              )
            ],
          ),
        ),
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
          case EditNoteNavState.pop:
            onEditSuccess?.call();
            context.pop();
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
