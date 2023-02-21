import 'package:core/l10n/core_localizations_extensions.dart';
import 'package:flutter/material.dart';
import 'package:notes/l10n/notes_localizations_extensions.dart';
import 'package:notes/presentation/connectors/edit_note_connector.dart';
import 'package:ui/theme/ui.dart';
import 'package:ui/widgets_base/custom_text_form_field.dart';

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
  bool _isSaveButtonEnabled = false;
  late final Map<_NoteFormKeys, TextFormFieldValidationProps>
      _validationPropsMap;

  void setInitialValues() {
    _validationPropsMap.reset();
    _isSaveButtonEnabled = false;
  }

  @override
  void initState() {
    super.initState();
    _validationPropsMap = {
      _NoteFormKeys.title: TextFormFieldValidationProps(
        validator: (input) =>
        input.isEmpty ? context.l10n.emptyFieldErrorMessage : null,
      ),
      _NoteFormKeys.description: TextFormFieldValidationProps(),
    };
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
        onChanged: () => setState(() {
          _isSaveButtonEnabled = _validationPropsMap.isValid();
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              validationProps: _validationPropsMap[_NoteFormKeys.title]!,
              label: context.l10nNotes.title,
            ),
            SizedBox(height: UI.dimens.d16),
            Expanded(
              child: CustomTextFormField(
                validationProps:
                    _validationPropsMap[_NoteFormKeys.description]!,
                label: context.l10nNotes.description,
              ),
            ),
            SizedBox(height: UI.dimens.d16 * 2),
            ElevatedButton(
              onPressed: _isSaveButtonEnabled
                  ? () => widget.onSave(
                        NoteFormData(
                          title: _validationPropsMap.getText(
                            _NoteFormKeys.title,
                          )!,
                          description: _validationPropsMap.getText(
                            _NoteFormKeys.description,
                          )!,
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
    _validationPropsMap.disposeAllControllers();
    super.dispose();
  }
}

enum _NoteFormKeys { title, description }
