import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:todo/di/app_di.dart';
import 'package:todo/navigation/home_nav.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/presentation/home/widgets/home_add_button.dart';
import 'package:todo/presentation/home/widgets/home_loading_widget.dart';
import 'package:todo/presentation/home/widgets/home_notes_list.dart';
import 'package:todo/utils/ui/snackbar.dart';

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
          appBar: AppBar(title: const Text("Notes App")),
          body: Stack(
            children: [
              const HomeLoadingWidget(),
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) =>
                    previous.breakingMessage != current.breakingMessage,
                builder: (context, state) => state.breakingMessage != null
                    ? Center(child: Text(state.breakingMessage!))
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
          await Get.toNamed(HomeRoute.addNote.name);
          bloc.add(HomeStarted());
        } else if (navState is HomeNavToEditNote) {
          final path =
              HomeRoute.editNote.name.replaceFirst(':id', navState.noteId);
          print(path);
          await Get.toNamed(
            HomeRoute.editNote.name.replaceFirst(':id', navState.noteId),
          );
          bloc.add(HomeStarted());
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
