import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class ToggleNoteCompletedRequest extends Action {
  final String id;

  const ToggleNoteCompletedRequest({required this.id});
}

class ToggleNoteCompletedMiddleware
    extends CustomMiddleware<ToggleNoteCompletedRequest> {
  final NoteRepository repository;

  ToggleNoteCompletedMiddleware({
    required this.repository,
  });

  @override
  Future execute(
    Store<AppState> store,
    ToggleNoteCompletedRequest action,
  ) async {
    final note = selectNote(store.state, action.id);
    if (note == null) return;

    store.dispatch(SetNotesLoadingAction());
    await repository.toggleCompleted(
      noteId: note.id,
      newState: !note.isCompleted,
    );
    store.dispatch(
      UpdateNoteAction(
        note.copyWith(
          isCompleted: !note.isCompleted,
        ),
      ),
    );
  }

  @override
  void onFailure(
    Store<AppState> store,
    ToggleNoteCompletedRequest action,
    Failure failure,
  ) {
    store.dispatch(SetNotesFailureAction(failure));
  }
}
