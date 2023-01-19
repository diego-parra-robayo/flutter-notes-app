import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../di/app_di.dart';
import '../bloc/add_note_bloc.dart';

class AddNoteScreenWrapper extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  const AddNoteScreenWrapper({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddNoteBloc>(),
      child: MultiBlocListener(
        listeners: [
          _getNavigationListener(),
          _getPopUpMessageListener(),
        ],
        child: Builder(builder: builder),
      ),
    );
  }

  BlocListener _getNavigationListener() {
    return BlocListener<AddNoteBloc, AddNoteState>(
      listenWhen: (previous, current) => previous.navState != current.navState,
      listener: (context, state) {
        final bloc = context.read<AddNoteBloc>();
        final navState = state.navState;
        switch (navState) {
          case null:
            return;
          case AddNoteNavState.pop:
            Get.back();
            break;
        }
        bloc.add(AddNoteNavEventHandled());
      },
    );
  }

  BlocListener _getPopUpMessageListener() {
    return BlocListener<AddNoteBloc, AddNoteState>(
      listenWhen: (previous, current) => previous.navState != current.navState,
      listener: (context, state) {
        final popUpMessage = state.popUpMessage;
        if (popUpMessage == null) return;
        Get.showSnackbar(GetSnackBar(title: popUpMessage));
        context.read<AddNoteBloc>().add(AddNotePopUpMessageShown());
      },
    );
  }
}
