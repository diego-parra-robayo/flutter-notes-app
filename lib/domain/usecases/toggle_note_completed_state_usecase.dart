import 'package:dartz/dartz.dart';
import 'package:todo/domain/repositories/note_repository.dart';

import '../../utils/failure.dart';

class ToggleNoteCompletedStateUseCase {
  final NoteRepository repository;

  const ToggleNoteCompletedStateUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call({
    required String noteId,
  }) =>
      repository.toggleCompleted(noteId: noteId);
}
