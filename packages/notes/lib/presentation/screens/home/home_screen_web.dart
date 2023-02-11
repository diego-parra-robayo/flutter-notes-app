import 'package:flutter/material.dart';
import 'package:locale/extensions/app_localizations_extensions.dart';
import 'package:notes/presentation/builders/builders.dart';
import 'package:ui/widgets_web/widgets_web.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotesLoadingBuilder(
            builder: (context, isLoading) =>
                isLoading ? const LoadingWidget() : const SizedBox.shrink(),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(title: Text(context.l10n.appName)),
              NotesBreakingMessageBuilder(
                builder: (context, message) => message != null
                    ? SliverToBoxAdapter(
                        child: Center(child: Text(message)),
                      )
                    : NotesListBuilder(
                        builder: (context, model) => NotesListWidget(
                          notes: model.notes,
                          onRefresh: model.onRefresh,
                          onNotePressed: model.onNotePressed,
                          onToggleCompleted: model.onToggleCompleted,
                          onDeleteNote: model.onDeleteNote,
                          onAddNote: model.onAddNote,
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
