import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:locale/generated/app_localizations.dart';
import 'package:notes/presentation/connectors/edit_note_connector.dart';
import 'package:notes/presentation/widgets/note_form.dart';

class EditNoteScreen extends StatelessWidget {
  final String? noteId;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(context.l10n)),
      ),
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

  String getTitle(AppLocalizations l10n) =>
      isNewNote ? l10n.createNoteTitle : l10n.editNoteTitle;
}
