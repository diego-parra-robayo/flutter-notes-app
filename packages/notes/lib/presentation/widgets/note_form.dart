import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/connectors/edit_note_connector.dart';
import 'package:ui/theme/ui.dart';

class NoteForm extends StatefulWidget {
  final NoteFormData? initialData;
  final void Function(NoteFormData data) onSave;

  const NoteForm({
    Key? key,
    required this.initialData,
    required this.onSave,
  }) : super(key: key);

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isSaveButtonEnabled = false;

  void setInitialValues() {
    _titleController.text = widget.initialData?.title ?? '';
    _descriptionController.text = widget.initialData?.description ?? '';
    _isSaveButtonEnabled = false;
  }

  @override
  void initState() {
    super.initState();
    //  Still required apart from didUpdateWidget since, when there are no changes
    //  in store note details (they may have been previously loaded by opening and
    //  closing this form), just initState will be called.
    setInitialValues();
  }

  @override
  void didUpdateWidget(covariant NoteForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    //  When loading note details to update:
    //  First time this widget is created, it is likely note details are null in store.
    //  So initState is called, but values are blank and controllers let it blank.
    //  Then, store gets updated with note details, but does this widget is not
    //  recreated from scratch, instead it didUpdateWidget and build method are called.
    setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UI.dimens.d16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () => setState(() {
          _isSaveButtonEnabled = _formKey.currentState?.validate() == true;
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
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
            Expanded(
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  label: Text(context.l10n.description),
                ),
              ),
            ),
            SizedBox(height: UI.dimens.d16 * 2),
            ElevatedButton(
              onPressed: _isSaveButtonEnabled
                  ? () => widget.onSave(
                        NoteFormData(
                          title: _titleController.text,
                          description: _descriptionController.text,
                        ),
                      )
                  : null,
              child: Text(context.l10n.save),
            ),
          ],
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
