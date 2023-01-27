import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:ui/l10n/app_localizations_extensions.dart';
import 'package:ui/theme/ui.dart';

class EditNoteContent extends ConsumerStatefulWidget {
  final String? id;
  final String? initialTitle;
  final String? initialDescription;

  const EditNoteContent({
    Key? key,
    this.id,
    this.initialTitle = '',
    this.initialDescription = '',
  }) : super(key: key);

  @override
  ConsumerState<EditNoteContent> createState() => _EditNoteContentState();
}

class _EditNoteContentState extends ConsumerState<EditNoteContent> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.initialTitle);
    descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.dimens.d16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(label: Text(context.l10n.title)),
          ),
          SizedBox(height: UI.dimens.d16),
          Expanded(
            child: TextField(
              controller: descriptionController,
              decoration:
                  InputDecoration(label: Text(context.l10n.description)),
            ),
          ),
          SizedBox(height: UI.dimens.d16),
          ElevatedButton(
            onPressed: _onSave,
            child: Text(context.l10n.save),
          ),
        ],
      ),
    );
  }

  void _onSave() async {
    final notesNotifier = ref.read(notesProvider.notifier);
    final id = widget.id;
    final title = titleController.text;
    final description = descriptionController.text;

    if (id == null) {
      await notesNotifier.addNote(title, description);
    } else {
      await notesNotifier.editNote(id, title, description);
    }

    if (mounted) context.pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
