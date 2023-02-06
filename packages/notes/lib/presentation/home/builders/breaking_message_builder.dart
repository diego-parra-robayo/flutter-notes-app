import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';

class BreakingMessageBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, String? message) builder;

  const BreakingMessageBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.breakingMessage(l10n) != current.breakingMessage(l10n),
      builder: (context, state) => builder(
        context,
        state.breakingMessage(l10n),
      ),
    );
  }
}
