import 'package:dartz/dartz.dart';
import 'package:todo/domain/repositories/note_repository.dart';

import '../../utils/failure.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  const DeleteNoteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String noteId,
  }) =>
      repository.deleteNote(noteId: noteId);
}
