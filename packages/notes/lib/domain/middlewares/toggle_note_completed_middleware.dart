import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class ToggleNoteCompletedThunk extends Action {
  final String id;

  const ToggleNoteCompletedThunk({required this.id});
}

class ToggleNoteCompletedMiddleware
    extends CustomMiddleware<ToggleNoteCompletedThunk> {
  final NoteRepository repository;

  ToggleNoteCompletedMiddleware({
    required this.repository,
  });

  @override
  Future execute(
    Store<AppState> store,
    ToggleNoteCompletedThunk action,
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
    ToggleNoteCompletedThunk action,
    Failure failure,
  ) {
    store.dispatch(
      SetNotesFailureAction(
        failure.copyWith(
          type: FailureType.popUpMessage,
        ),
      ),
    );
  }
}
