import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:locale/generated/app_localizations.dart';
import 'package:notes/presentation/connectors/edit_note_connector.dart';
import 'package:notes/presentation/widgets/note_form.dart';

class EditNoteScreen extends StatefulWidget {
  final String? noteId;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(context.l10n)),
      ),
      body: EditNoteFormConnector(
        noteId: widget.noteId,
        builder: (context, initialFormData) => NoteForm(
          formKey: _formKey,
          titleController: _titleController,
          descriptionController: _descriptionController,
        ),
      ),
      floatingActionButton: EditNoteSaveFormConnector(
        noteId: widget.noteId,
        builder: (context, callback) => FloatingActionButton(
          onPressed: _formKey.currentState?.validate() != true
              ? null
              : () => callback(
                    NoteFormData(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    ),
                  ),
          child: saveIcon,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

extension on State<EditNoteScreen> {
  bool get isNewNote => widget.noteId == null;

  String getTitle(AppLocalizations l10n) =>
      isNewNote ? l10n.createNoteTitle : l10n.editNoteTitle;

  Icon get saveIcon => Icon(isNewNote ? Icons.add : Icons.save);
}
