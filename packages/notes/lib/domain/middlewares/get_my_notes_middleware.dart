import 'package:notes/domain/repositories/note_repository.dart';
import 'package:redux_core/auth/auth_selectors.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/notes_actions.dart';
import 'package:redux_core/notes/notes_selectors.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';
import 'package:redux_core/utils/action.dart';

class GetMyNotesRequest extends Action {
  final bool forceRefresh;

  const GetMyNotesRequest({
    this.forceRefresh = true,
  });
}

class GetMyNotesMiddleware extends CustomMiddleware<GetMyNotesRequest> {
  final NoteRepository repository;

  GetMyNotesMiddleware({
    required this.repository,
  });

  @override
  Future execute(Store<AppState> store, GetMyNotesRequest action) async {
    final authUser = selectAuthenticatedProfile(store.state);
    if (authUser == null) throw const UnauthenticatedFailure();

    if (!action.forceRefresh &&
        selectNotes(store.state)
            .where((note) => note.id == authUser.userId)
            .isNotEmpty) {
      return;
    }

    store.dispatch(SetNotesLoadingAction());
    final notes = await repository.getNotesByUser(userId: authUser.userId);
    store.dispatch(SetNotesAction(notes));
  }

  @override
  void onFailure(
    Store<AppState> store,
    GetMyNotesRequest action,
    Failure failure,
  ) {
    store.dispatch(SetNotesFailureAction(failure, isBreakingFailure: true));
  }
}
