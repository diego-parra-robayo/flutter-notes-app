import 'package:core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/update_note_request.dart';
import '../repositories/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String noteId,
    required String title,
    required String description,
  }) async {
    try {
      await repository.updateNote(
        request: UpdateNoteRequest(
          noteId: noteId,
          title: title,
          description: description,
        ),
      );
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
