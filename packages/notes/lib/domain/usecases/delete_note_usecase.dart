import 'package:core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  const DeleteNoteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String noteId,
  }) async {
    try {
      await repository.deleteNote(noteId: noteId);
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
