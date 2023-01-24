import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:dartz/dartz.dart';

import '../repositories/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  const GetNotesUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Note>>> call() => repository.getNotes();
}
