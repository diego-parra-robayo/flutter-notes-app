import 'package:dartz/dartz.dart';
import 'package:todo/domain/entities/note.dart';
import 'package:todo/domain/repositories/note_repository.dart';

import '../../utils/failure.dart';

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
