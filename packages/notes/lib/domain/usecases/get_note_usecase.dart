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
  }) =>
      repository.getNote(noteId: noteId);
}
