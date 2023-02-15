import 'package:flutter/material.dart';
import 'package:ui/theme/ui.dart';

class NoteLabels extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;

  const NoteLabels({
    Key? key,
    required this.title,
    required this.description,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        SizedBox(height: UI.dimens.d8),
        Text(
          description,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
