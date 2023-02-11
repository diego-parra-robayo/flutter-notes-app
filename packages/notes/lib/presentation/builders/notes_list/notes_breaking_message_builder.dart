import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';

class NotesBreakingMessageBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, String? message) builder;

  const NotesBreakingMessageBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<NotesBloc, NotesState>(
      buildWhen: (previous, current) =>
          previous.breakingMessage(l10n) != current.breakingMessage(l10n),
      builder: (context, state) => builder(
        context,
        state.breakingMessage(l10n),
      ),
    );
  }
}
