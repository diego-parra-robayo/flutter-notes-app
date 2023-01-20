import 'package:dartz/dartz.dart';
import 'package:todo/domain/entities/new_note_request.dart';
import 'package:todo/utils/failure.dart';

import '../entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, Note>> getNote({
    required String noteId,
  });
  Future<Either<Failure, Unit>> addNote({
    required NewNoteRequest request,
  });
  Future<Either<Failure, Unit>> toggleCompleted({
    required String noteId,
  });
  Future<Either<Failure, Unit>> deleteNote({
    required String noteId,
  });
}
