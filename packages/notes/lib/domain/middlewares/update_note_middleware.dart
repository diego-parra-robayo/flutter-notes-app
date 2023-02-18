import 'package:redux_core/redux_core.dart';

import '../entities/update_note_request_model.dart';
import '../repositories/note_repository.dart';

class UpdateNoteRequest extends Action {
  final String id;
  final String title;
  final String description;

  UpdateNoteRequest({
    required this.id,
    required this.title,
    required this.description,
  });
}

class UpdateNoteMiddleware extends CustomMiddleware<UpdateNoteRequest> {
  final NoteRepository repository;

  UpdateNoteMiddleware({required this.repository});

  @override
  Future execute(Store<AppState> store, UpdateNoteRequest action) async {
    final note = selectNote(store.state, action.id);
    if (note == null) return;

    store.dispatch(SetNoteDetailsLoadingAction());
    final updatedNote = note.copyWith(
      title: action.title,
      description: action.description,
    );
    await repository.updateNote(
      request: UpdateNoteRequestModel(
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
    UpdateNoteRequest action,
    Failure failure,
  ) {
    store.dispatch(SetNoteDetailsFailureAction(failure));
  }
}
