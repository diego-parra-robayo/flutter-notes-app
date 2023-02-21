import 'package:flutter/material.dart';
import 'package:notes/l10n/notes_localizations.dart';
import 'package:notes/l10n/notes_localizations_extensions.dart';
import 'package:notes/presentation/connectors/edit_note_connector.dart';
import 'package:notes/presentation/widgets/note_form.dart';
import 'package:notes/presentation/widgets/notes_app_bar.dart';

class EditNoteScreen extends StatelessWidget {
  final String? noteId;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(title: getTitle(context.l10nNotes)),
      body: EditNoteConnector(
        noteId: noteId,
        builder: (context, vm) => NoteForm(
          initialData: vm.initialFormData,
          onSave: vm.onSaveCallback,
        ),
      ),
    );
  }
}

extension on EditNoteScreen {
  bool get isNewNote => noteId == null;

  String getTitle(NotesLocalizations l10n) =>
      isNewNote ? l10n.createNoteTitle : l10n.editNoteTitle;
}
