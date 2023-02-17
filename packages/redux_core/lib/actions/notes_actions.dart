import 'package:redux_core/entities/entities.dart';

import 'action.dart';

class SetNotesLoadingAction extends Action {}

class SetNotesFailureAction extends Action {
  final Failure failure;
  final bool isBreakingFailure;

  SetNotesFailureAction(
    this.failure, {
    this.isBreakingFailure = false,
  });
}

class SetNotesAction extends Action {
  final List<Note> notes;

  const SetNotesAction(this.notes);
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
