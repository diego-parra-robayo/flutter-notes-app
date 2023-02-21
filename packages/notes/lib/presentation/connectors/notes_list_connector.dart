import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/middlewares/get_my_notes_middleware.dart';
import 'package:notes/domain/middlewares/middlewares.dart';
import 'package:notes/l10n/notes_localizations_extensions.dart';
import 'package:notes/navigation/notes_routes.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/note.dart';
import 'package:redux_core/notes/notes_selectors.dart';
import 'package:redux_core/notes/notes_state.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:ui/widgets_base/resource_connector.dart';

class NotesListConnector extends StatelessWidget {
  final Widget Function(BuildContext context, NotesListViewModel vm)
      dataBuilder;

  const NotesListConnector({
    Key? key,
    required this.dataBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourceConnector<AppState, NotesListViewModel>(
      onInit: (store) => store.dispatch(const GetMyNotesRequest()),
      loadingSelector: selectNotesIsLoading,
      popUpFailureSelector: selectNotesPopUpFailure,
      breakingMessageSelector: (state) {
        final failure = selectNotesBreakingFailure(state);
        if (failure != null) return failure;
        if (state.notes.status != NotesStatus.loading &&
            state.notes.noteIdList.isEmpty) {
          return Failure(
            getMessage: (context) => context.l10nNotes.emptyNotesListMessage,
          );
        }
        return null;
      },
      dataConverter: (store) => NotesListViewModel.fromStore(store, context),
      dataBuilder: dataBuilder,
    );
  }
}

class NotesListViewModel extends Equatable {
  final List<Note> notes;
  final void Function() onRefresh;
  final void Function(Note note) onNotePressed;
  final void Function(String id) onToggleCompleted;
  final void Function(String id) onDeleteNote;

  const NotesListViewModel({
    required this.notes,
    required this.onRefresh,
    required this.onNotePressed,
    required this.onToggleCompleted,
    required this.onDeleteNote,
  });

  factory NotesListViewModel.fromStore(
    Store<AppState> store,
    BuildContext context,
  ) {
    return NotesListViewModel(
      notes: selectNotes(store.state),
      onRefresh: () =>
          store.dispatch(const GetMyNotesRequest(forceRefresh: true)),
      onNotePressed: (note) => context.goNamed(
        NotesRoute.editNote,
        params: {'id': note.id},
      ),
      onToggleCompleted: (id) => store.dispatch(
        ToggleNoteCompletedRequest(id: id),
      ),
      onDeleteNote: (id) => store.dispatch(DeleteNoteRequest(id)),
    );
  }

  @override
  List<Object?> get props => [notes];
}
