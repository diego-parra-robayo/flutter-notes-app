import 'package:redux_core/redux_core.dart';

import '../repositories/note_repository.dart';

class GetNotesRequest extends Action {
  const GetNotesRequest();
}

class GetNotesMiddleware extends CustomMiddleware<GetNotesRequest> {
  final NoteRepository repository;

  GetNotesMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, GetNotesRequest action) async {
    store.dispatch(SetNotesLoadingAction());
    final notes = await repository.getNotes();
    store.dispatch(SetNotesAction(notes));
  }

  @override
  void onFailure(Store<AppState> store, GetNotesRequest action, Failure failure) {
    store.dispatch(SetNotesFailureAction(failure, isBreakingFailure: true));
  }
}
