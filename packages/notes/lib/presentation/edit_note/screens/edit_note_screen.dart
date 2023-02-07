import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/edit_note/builders/builders.dart';
import 'package:ui/widgets/widgets.dart';
import 'package:ui/theme/ui.dart';

class EditNoteScreen extends StatelessWidget {
  final String? noteId;
  final void Function()? onEditSuccess;

  const EditNoteScreen({
    Key? key,
    required this.noteId,
    this.onEditSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditNoteScreenBuilder(
      noteId: noteId,
      onEditSuccess: onEditSuccess,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            noteId == null
                ? context.l10n.createNoteTitle
                : context.l10n.editNoteTitle,
          ),
        ),
        body: Stack(
          children: [
            LoadingBuilder(
              builder: (context, isLoading) =>
                  isLoading ? const LoadingWidget() : const SizedBox.shrink(),
            ),
            Padding(
              padding: EdgeInsets.all(UI.dimens.d16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleBuilder(
                    builder: (context, controller) => TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        label: Text(context.l10n.title),
                      ),
                    ),
                  ),
                  SizedBox(height: UI.dimens.d16),
                  Expanded(
                    child: DescriptionBuilder(
                      builder: (context, controller) => TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          label: Text(context.l10n.description),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: SaveNoteBuilder(
          builder: (context, onPressed) => FloatingActionButton(
            onPressed: onPressed,
            child: Icon(noteId == null ? Icons.add : Icons.save),
          ),
        ),
      ),
    );
  }
}
