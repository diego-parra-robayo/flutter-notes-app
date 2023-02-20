import '../failure/failure.dart';
import '../utils/action.dart';
import 'note.dart';

class SetNotesLoadingAction extends Action {}

class SetNotesFailureAction extends Action {
  final Failure failure;
  final bool isBreakingFailure;

  const SetNotesFailureAction(
    this.failure, {
    this.isBreakingFailure = false,
  });
}

class SetNotesAction extends Action {
  final List<Note> notes;

  const SetNotesAction(this.notes);
}

class SetNoteDetailsAction extends Action {
  final Note? note;

  const SetNoteDetailsAction(this.note);
}

class AddNoteAction extends Action {
  final Note newNote;

  const AddNoteAction(this.newNote);
}

class UpdateNoteAction extends Action {
  final Note updatedNote;

  const UpdateNoteAction(this.updatedNote);
}

class DeleteNoteAction extends Action {
  final String id;

  const DeleteNoteAction(this.id);
}
