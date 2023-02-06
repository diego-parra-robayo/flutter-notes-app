import 'package:core/di/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/extensions/snackbar.dart';

import '../../../navigation/home_nav.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_add_button.dart';
import '../widgets/home_loading_widget.dart';
import '../widgets/home_notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeStarted()),
      child: MultiBlocListener(
        listeners: [
          _getNavigationListener(),
          _getPopUpMessageListener(),
        ],
        child: Scaffold(
          appBar: AppBar(title: Text(context.l10n.appName)),
          body: Stack(
            children: [
              const HomeLoadingWidget(),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    previous.breakingMessage(context.l10n) !=
                    current.breakingMessage(context.l10n),
                builder: (context, state) => state
                            .breakingMessage(context.l10n) !=
                        null
                    ? Center(child: Text(state.breakingMessage(context.l10n)!))
                    : const HomeNotesList(),
              )
            ],
          ),
          floatingActionButton: const HomeAddButton(),
        ),
      ),
    );
  }

  BlocListener _getNavigationListener() {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.navState != current.navState,
      listener: (context, state) async {
        final bloc = context.read<HomeBloc>();
        final navState = state.navState;
        if (navState == null) {
          return;
        } else if (navState is HomeNavToAddNote) {
          context.goNamed(
            HomeRoute.addNote.name,
            extra: {'onSuccess': () => bloc.add(HomeStarted())},
          );
        } else if (navState is HomeNavToEditNote) {
          context.goNamed(
            HomeRoute.editNote.name,
            params: {'id': navState.noteId},
            extra: {'onSuccess': () => bloc.add(HomeStarted())},
          );
        }
        bloc.add(HomeNavEventHandled());
      },
    );
  }

  BlocListener _getPopUpMessageListener() {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) =>
          previous.popUpMessage != current.popUpMessage,
      listener: (context, state) {
        final popUpMessage = state.popUpMessage;
        if (popUpMessage == null) return;
        showSnackBar(context, message: popUpMessage);
        context.read<HomeBloc>().add(HomePopUpMessageShown());
      },
    );
  }
}
