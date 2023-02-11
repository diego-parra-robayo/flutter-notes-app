import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/home_nav.dart';

class NavigateToAddNoteBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, void Function() navigate) builder;

  const NavigateToAddNoteBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => builder(
        context,
        () => context.goNamed(HomeRoute.addNote),
      ),
    );
  }
}
