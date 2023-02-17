import 'package:redux_core/redux_core.dart';

import '../entities/new_note_request.dart';
import '../repositories/note_repository.dart';

class AddNoteThunk extends Action {
  final String title;
  final String description;

  const AddNoteThunk({
    required this.title,
    required this.description,
  });
}

class AddNoteMiddleware extends CustomMiddleware<AddNoteThunk> {
  final NoteRepository repository;

  AddNoteMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, AddNoteThunk action) async {
    store.dispatch(SetNoteDetailsLoadingAction());
    final note = await repository.addNote(
      request: NewNoteRequest(
        title: action.title,
        description: action.description,
      ),
    );
    store.dispatch(AddNoteAction(note));
  }

  @override
  void onFailure(Store<AppState> store, AddNoteThunk action, Failure failure) {
    store.dispatch(SetNoteDetailsFailureAction(failure));
  }
}
