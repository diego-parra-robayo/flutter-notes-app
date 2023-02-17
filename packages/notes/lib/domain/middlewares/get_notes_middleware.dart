import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class GetNotesThunk extends Action {
  const GetNotesThunk();
}

class GetNotesMiddleware extends CustomMiddleware<GetNotesThunk> {
  final NoteRepository repository;

  GetNotesMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, GetNotesThunk action) async {
    store.dispatch(SetNotesLoadingAction());
    final notes = await repository.getNotes();
    store.dispatch(SetNotesAction(notes));
  }

  @override
  void onFailure(Store<AppState> store, GetNotesThunk action, Failure failure) {
    store.dispatch(SetNotesFailureAction(failure, isBreakingFailure: true));
  }
}
