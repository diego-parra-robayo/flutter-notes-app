import 'package:redux_core/redux_core.dart';

import '../entities/update_note_request.dart';
import '../repositories/note_repository.dart';

class UpdateNoteThunk extends Action {
  final String id;
  final String title;
  final String description;

  UpdateNoteThunk({
    required this.id,
    required this.title,
    required this.description,
  });
}

class UpdateNoteMiddleware extends CustomMiddleware<UpdateNoteThunk> {
  final NoteRepository repository;

  UpdateNoteMiddleware({required this.repository});

  @override
  Future execute(Store<AppState> store, UpdateNoteThunk action) async {
    final note = selectNote(store.state, action.id);
    if (note == null) return;

    final updatedNote = note.copyWith(
      title: action.title,
      description: action.description,
    );
    await repository.updateNote(
      request: UpdateNoteRequest(
        noteId: updatedNote.id,
        title: updatedNote.title,
        description: updatedNote.description,
      ),
    );

    store.dispatch(UpdateNoteAction(updatedNote));
  }

  @override
  void onFailure(
    Store<AppState> store,
    UpdateNoteThunk action,
    Failure failure,
  ) {
    store.dispatch(
      SetNoteDetailsFailureAction(
        failure.copyWith(
          type: FailureType.popUpMessage,
        ),
      ),
    );
  }
}
