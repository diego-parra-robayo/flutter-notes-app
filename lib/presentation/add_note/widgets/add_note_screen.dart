import 'package:flutter/material.dart';
import 'package:todo/presentation/add_note/widgets/add_note_loading_widget.dart';
import 'package:todo/presentation/add_note/widgets/add_note_screen_wrapper.dart';
import 'package:todo/presentation/add_note/widgets/description_field.dart';
import 'package:todo/presentation/add_note/widgets/save_note_button.dart';
import 'package:todo/presentation/add_note/widgets/title_field.dart';
import 'package:todo/utils/ui/theme/ui.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddNoteScreenWrapper(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create new note')),
          body: Stack(
            children: [
              const AddNoteLoadingWidget(),
              Padding(
                padding: EdgeInsets.all(UI.dimens.d16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TitleField(),
                    SizedBox(height: UI.dimens.d16),
                    const Expanded(child: DescriptionField()),
                    SizedBox(height: UI.dimens.d16),
                    const SaveNoteButton(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
