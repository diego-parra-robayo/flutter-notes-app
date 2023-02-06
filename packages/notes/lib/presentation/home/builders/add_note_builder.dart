import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';

class AddNoteBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, void Function() onPressed)
      builder;

  const AddNoteBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => builder(
        context,
        () => _dispatchAddPressed(context),
      ),
    );
  }

  void _dispatchAddPressed(BuildContext context) =>
      context.read<HomeBloc>().add(HomeAddNotePressed());
}
