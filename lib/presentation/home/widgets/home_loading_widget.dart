import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/utils/ui/loading_widget.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) =>
          state.isLoading ? const LoadingWidget() : const SizedBox.shrink(),
    );
  }
}
