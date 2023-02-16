import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/navigation/notes_routes.dart';

class NavigateToAddNoteBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, void Function() navigate) builder;

  const NavigateToAddNoteBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      () => context.goNamed(NotesRoute.addNote),
    );
  }
}
