import 'package:core/l10n/core_localizations_extensions.dart';
import 'package:flutter/material.dart';
import 'package:notes/presentation/connectors/navigate_to_add_note_builder.dart';
import 'package:notes/presentation/connectors/notes_list_connector.dart';
import 'package:notes/presentation/widgets/notes_app_bar.dart';
import 'package:ui/widgets_app/notes_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(title: context.l10n.appName),
      body: NotesListConnector(
        dataBuilder: (context, vm) => NotesListWidget(
          notes: vm.notes,
          onRefresh: vm.onRefresh,
          onNotePressed: vm.onNotePressed,
          onToggleCompleted: vm.onToggleCompleted,
          onDeleteNote: vm.onDeleteNote,
        ),
      ),
      floatingActionButton: NavigateToAddNoteBuilder(
        builder: (context, navigate) => FloatingActionButton(
          onPressed: navigate,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
