import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:ui/widgets_mobile/widgets_mobile.dart';

import '../builders/add_note_builder.dart';
import '../builders/breaking_message_builder.dart';
import '../builders/loading_builder.dart';
import '../builders/notes_list_builder.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.appName)),
      body: Stack(
        children: [
          LoadingBuilder(
            builder: (context, isLoading) =>
                isLoading ? const LoadingWidget() : const SizedBox.shrink(),
          ),
          BreakingMessageBuilder(
            builder: (context, message) => message != null
                ? Center(child: Text(message))
                : NotesListBuilder(
                    builder: (context, model) => NotesListWidget(
                      notes: model.notes,
                      onRefresh: model.onRefresh,
                      onNotePressed: model.onNotePressed,
                      onToggleCompleted: model.onToggleCompleted,
                      onDeleteNote: model.onDeleteNote,
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: AddNoteBuilder(
        builder: (context, onPressed) => FloatingActionButton(
          onPressed: onPressed,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
