import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/home/builders/builders.dart';
import 'package:ui/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreenBuilder(
      child: Scaffold(
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
      ),
    );
  }
}
