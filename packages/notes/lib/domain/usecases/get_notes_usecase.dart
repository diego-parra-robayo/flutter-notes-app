import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  const GetNotesUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Note>>> call() => repository.getNotes();
}
