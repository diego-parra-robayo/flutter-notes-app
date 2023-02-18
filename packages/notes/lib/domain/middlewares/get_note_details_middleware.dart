import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class GetNoteDetailsRequest extends Action {
  final String? id;

  const GetNoteDetailsRequest({required this.id});
}

class GetNoteDetailsMiddleware extends CustomMiddleware<GetNoteDetailsRequest> {
  final NoteRepository repository;

  GetNoteDetailsMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, GetNoteDetailsRequest action) async {
    if (selectNoteDetails(store.state)?.id == action.id) return;

    store.dispatch(SetNoteDetailsAction(note: null));

    if (action.id != null) {
      store.dispatch(SetNoteDetailsLoadingAction());
      final note = await repository.getNote(noteId: action.id!);
      store.dispatch(SetNoteDetailsAction(note: note));
    }
  }

  @override
  void onFailure(
    Store<AppState> store,
    GetNoteDetailsRequest action,
    Failure failure,
  ) {
    store.dispatch(
      SetNoteDetailsFailureAction(failure, isBreakingFailure: true),
    );
  }
}
