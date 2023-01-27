import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/domain/providers/note_provider.dart';
import 'package:ui/components/loading_widget.dart';
import 'package:ui/l10n/app_localizations_extensions.dart';

import '../widgets/edit_note_content.dart';

class EditNoteScreen extends ConsumerWidget {
  final String? noteId;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (noteId == null) {
      return const EditNoteContent();
    } else {
      return ref.watch(noteProvider(noteId!)).when(
            loading: () => const Scaffold(
              body: LoadingWidget(),
            ),
            error: (error, stackTrace) => Scaffold(
              body: Center(child: Text(error.toString())),
            ),
            data: (note) => Scaffold(
              appBar: AppBar(title: Text(context.l10n.editNoteTitle)),
              body: EditNoteContent(
                id: noteId,
                initialTitle: note.title,
                initialDescription: note.description,
              ),
            ),
          );
    }
  }
}
