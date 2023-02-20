import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/notes_actions.dart';
import 'package:redux_core/notes/notes_selectors.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

import '../repositories/note_repository.dart';

class GetNoteDetailsRequest extends Action {
  final String? id;
  final bool forceRefresh;

  const GetNoteDetailsRequest({
    required this.id,
    this.forceRefresh = true,
  });
}

class GetNoteDetailsMiddleware extends CustomMiddleware<GetNoteDetailsRequest> {
  final NoteRepository repository;

  GetNoteDetailsMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, GetNoteDetailsRequest action) async {
    if (!action.forceRefresh) {
      if (action.id == selectNoteDetails(store.state)?.id) {
        return;
      }
      final cachedNote = selectNotesMap(store.state)[action.id];
      if (cachedNote != null) {
        store.dispatch(SetNoteDetailsAction(cachedNote));
        return;
      }
    }

    store.dispatch(const SetNoteDetailsAction(null));

    if (action.id != null) {
      store.dispatch(SetNotesLoadingAction());
      final note = await repository.getNote(noteId: action.id!);
      store.dispatch(SetNoteDetailsAction(note));
    }
  }

  @override
  void onFailure(
    Store<AppState> store,
    GetNoteDetailsRequest action,
    Failure failure,
  ) {
    store.dispatch(SetNotesFailureAction(failure));
  }
}
