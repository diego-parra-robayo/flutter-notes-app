import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:todo/di/app_di.dart';
import 'package:todo/navigation/home_nav.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/presentation/home/widgets/home_add_button.dart';
import 'package:todo/presentation/home/widgets/home_loading_widget.dart';
import 'package:todo/presentation/home/widgets/home_notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeStarted()),
      child: MultiBlocListener(
        listeners: [
          _getNavigationListener(),
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
      listener: (context, state) {
        final bloc = context.read<HomeBloc>();
        final navState = state.navState;
        switch (navState) {
          case null:
            return;
          case HomeNavState.add:
            Get.toNamed(HomeRoute.addNote.name);
            break;
        }
        bloc.add(HomeNavEventHandled());
      },
    );
  }
}
