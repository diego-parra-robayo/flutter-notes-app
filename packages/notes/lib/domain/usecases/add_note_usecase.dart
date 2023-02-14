import 'package:core/entities/note.dart';
import 'package:core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/new_note_request.dart';
import '../repositories/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  const AddNoteUseCase({
    required this.repository,
  });

  Future<Either<Failure, Note>> call({
    required String title,
    required String description,
  }) async {
    try {
      final note = await repository.addNote(
        request: NewNoteRequest(
          title: title,
          description: description,
        ),
      );
      return Right(note);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
