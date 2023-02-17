import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class DeleteNoteThunk extends Action {
  final String id;

  const DeleteNoteThunk(this.id);
}

class DeleteNoteMiddleware extends CustomMiddleware<DeleteNoteThunk> {
  final NoteRepository repository;

  DeleteNoteMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, DeleteNoteThunk action) async {
    store.dispatch(SetNoteDetailsLoadingAction());
    await repository.deleteNote(noteId: action.id);
    store.dispatch(DeleteNoteAction(action.id));
  }

  @override
  void onFailure(
    Store<AppState> store,
    DeleteNoteThunk action,
    Failure failure,
  ) {
    store.dispatch(SetNoteDetailsFailureAction(failure));
  }
}
