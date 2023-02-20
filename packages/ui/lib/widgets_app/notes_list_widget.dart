import 'package:flutter/material.dart';
import 'package:redux_core/notes/note.dart';
import 'package:ui/device_utils/device_utils.dart';
import 'package:ui/theme/ui.dart';

import 'note_widget/note_widget.dart';

class NotesListWidget extends StatelessWidget with PlatformDependentWidget {
  final List<Note> notes;
  final void Function() onRefresh;
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;

  const NotesListWidget({
    Key? key,
    required this.notes,
    required this.onRefresh,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
  }) : super(key: key);

  @override
  Widget buildMobile(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.separated(
        itemCount: notes.length,
        itemBuilder: (context, index) => NoteWidget(
          note: notes[index],
          onPressed: onNotePressed,
          onToggleCompleted: onToggleCompleted,
          onDeletePressed: onDeleteNote,
          isDismissible: true,
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }

  @override
  Widget buildWeb(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(UI.dimens.d16),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width ~/ 300,
          mainAxisSpacing: UI.dimens.d16,
          crossAxisSpacing: UI.dimens.d16,
          mainAxisExtent: 100,
        ),
        itemBuilder: (context, index) => NoteWidget(
          note: notes[index],
          onPressed: onNotePressed,
          onToggleCompleted: onToggleCompleted,
          onDeletePressed: onDeleteNote,
          isDismissible: false,
        ),
        itemCount: notes.length,
      ),
    );
  }
}
