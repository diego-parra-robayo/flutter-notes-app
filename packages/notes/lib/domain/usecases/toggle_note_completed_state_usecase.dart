import 'package:core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/note_repository.dart';

class ToggleNoteCompletedStateUseCase {
  final NoteRepository repository;

  const ToggleNoteCompletedStateUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call({
    required String noteId,
    required bool newState,
  }) =>
      repository.toggleCompleted(noteId: noteId, newState: newState);
}
