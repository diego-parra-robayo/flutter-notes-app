import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _dispatchAddPressed(context),
      child: const Icon(Icons.add),
    );
  }

  void _dispatchAddPressed(BuildContext context) =>
      context.read<HomeBloc>().add(HomeAddNotePressed());
}
