import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/new_note_request.dart';
import '../entities/update_note_request.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNotes();
  Future<Either<Failure, Note>> getNote({
    required String noteId,
  });
  Future<Either<Failure, Unit>> addNote({
    required NewNoteRequest request,
  });
  Future<Either<Failure, Unit>> updateNote({
    required UpdateNoteRequest request,
  });
  Future<Either<Failure, Unit>> toggleCompleted({
    required String noteId,
    required bool newState,
  });
  Future<Either<Failure, Unit>> deleteNote({
    required String noteId,
  });
}
