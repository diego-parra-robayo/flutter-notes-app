import 'package:core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  const DeleteNoteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String noteId,
  }) =>
      repository.deleteNote(noteId: noteId);
}
