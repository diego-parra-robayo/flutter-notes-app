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
  }) async {
    try {
      await repository.toggleCompleted(noteId: noteId, newState: newState);
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
