import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/notes_actions.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

import '../entities/new_note_request_model.dart';
import '../repositories/note_repository.dart';

class AddNoteRequest extends Action {
  final String title;
  final String description;

  const AddNoteRequest({
    required this.title,
    required this.description,
  });
}

class AddNoteMiddleware extends CustomMiddleware<AddNoteRequest> {
  final NoteRepository repository;

  AddNoteMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, AddNoteRequest action) async {
    store.dispatch(SetNotesLoadingAction());
    final note = await repository.addNote(
      request: NewNoteRequestModel(
        title: action.title,
        description: action.description,
      ),
    );
    store.dispatch(AddNoteAction(note));
  }

  @override
  void onFailure(Store<AppState> store, AddNoteRequest action, Failure failure) {
    store.dispatch(SetNotesFailureAction(failure));
  }
}
