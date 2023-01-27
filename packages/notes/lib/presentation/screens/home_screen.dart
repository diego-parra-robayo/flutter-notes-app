import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/navigation/home_nav.dart';
import 'package:notes/presentation/widgets/home_notes_list.dart';
import 'package:ui/components/loading_widget.dart';
import 'package:ui/l10n/app_localizations_extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(notesProvider).when(
          error: (error, stackTrace) => Scaffold(
            body: Text(error.toString()),
          ),
          loading: () => const Scaffold(
            body: LoadingWidget(),
          ),
          data: (notes) => Scaffold(
            appBar: AppBar(title: Text(context.l10n.appName)),
            body: notes.isEmpty
                ? const Center(child: Text('Notes list is empty'))
                : HomeNotesList(notes: notes),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _navigateToAddNote(context),
              child: const Icon(Icons.add),
            ),
          ),
        );
  }

  void _navigateToAddNote(BuildContext context) =>
      context.goNamed(HomeRoute.addNote.name);
}
