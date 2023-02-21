import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/notes_actions.dart';
import 'package:redux_core/notes/notes_selectors.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

import '../entities/update_note_request_entity.dart';
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
    final note = selectNotesMap(store.state)[action.id];
    if (note == null) return;

    store.dispatch(SetNotesLoadingAction());
    final updatedNote = note.copyWith(
      title: action.title,
      description: action.description,
    );
    await repository.updateNote(
      request: UpdateNoteRequestEntity(
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
    store.dispatch(SetNotesFailureAction(failure));
  }
}
