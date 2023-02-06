import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';

class LoadingBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  const LoadingBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) => builder(context, state.isLoading),
    );
  }
}
