import 'package:dartz/dartz.dart';
import 'package:todo/domain/entities/note.dart';
import 'package:todo/domain/repositories/note_repository.dart';

import '../../utils/failure.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  const GetNotesUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<Note>>> call() => repository.getNotes();
}
