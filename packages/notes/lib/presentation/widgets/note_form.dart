import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/theme/ui.dart';

class NoteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final String? initialTitle;
  final String? initialDescription;

  const NoteForm({
    Key? key,
    required this.formKey,
    this.titleController,
    this.descriptionController,
    this.initialTitle,
    this.initialDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.dimens.d16),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: titleController,
              initialValue: initialTitle,
              decoration: InputDecoration(
                label: Text(context.l10n.title),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.nonEmptyValidationMessage;
                }
                return null;
              },
            ),
            SizedBox(height: UI.dimens.d16),
            TextFormField(
              controller: descriptionController,
              initialValue: initialDescription,
              decoration: InputDecoration(
                label: Text(context.l10n.description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
