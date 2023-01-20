import 'package:dartz/dartz.dart';
import 'package:todo/domain/entities/update_note_request.dart';
import 'package:todo/domain/repositories/note_repository.dart';

import '../../utils/failure.dart';

class UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required String noteId,
    required String title,
    required String description,
  }) =>
      repository.updateNote(
        request: UpdateNoteRequest(
          noteId: noteId,
          title: title,
          description: description,
        ),
      );
}
