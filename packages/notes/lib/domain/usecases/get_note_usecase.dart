import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/note_repository.dart';

class GetNoteUseCase {
  final NoteRepository repository;

  const GetNoteUseCase({
    required this.repository,
  });

  Future<Either<Failure, Note>> call({
    required String noteId,
  }) async {
    try {
      final note = await repository.getNote(noteId: noteId);
      return Right(note);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
