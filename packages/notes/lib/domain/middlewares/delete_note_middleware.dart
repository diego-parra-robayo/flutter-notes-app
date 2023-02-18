import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class DeleteNoteRequest extends Action {
  final String id;

  const DeleteNoteRequest(this.id);
}

class DeleteNoteMiddleware extends CustomMiddleware<DeleteNoteRequest> {
  final NoteRepository repository;

  DeleteNoteMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, DeleteNoteRequest action) async {
    store.dispatch(SetNoteDetailsLoadingAction());
    await repository.deleteNote(noteId: action.id);
    store.dispatch(DeleteNoteAction(action.id));
  }

  @override
  void onFailure(
    Store<AppState> store,
    DeleteNoteRequest action,
    Failure failure,
  ) {
    store.dispatch(SetNoteDetailsFailureAction(failure));
  }
}
