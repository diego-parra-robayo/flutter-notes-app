import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/components/loading_widget.dart';

import '../bloc/home_bloc.dart';

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
