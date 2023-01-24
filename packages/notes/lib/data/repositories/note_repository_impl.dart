import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:dartz/dartz.dart';
import 'package:notes/data/datasources/remote/mappers/note_model_mappers.dart';

import '../../domain/entities/new_note_request.dart';
import '../../domain/entities/update_note_request.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/remote/note_remote_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource dataSource;

  const NoteRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, Unit>> addNote({
    required NewNoteRequest request,
  }) async {
    try {
      await dataSource.addNote(
        title: request.title,
        description: request.description,
      );
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateNote({
    required UpdateNoteRequest request,
  }) async {
    try {
      await dataSource.updateNote(
        noteId: request.noteId,
        title: request.title,
        description: request.description,
      );
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> getNote({
    required String noteId,
  }) async {
    try {
      final noteModel = await dataSource.getNote(noteId: noteId);
      if (noteModel != null) {
        return Right(noteModel.toNote());
      } else {
        return Left(NotFound());
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final notes = await dataSource.getNotes();
      return Right(notes.map((noteModel) => noteModel.toNote()).toList());
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleCompleted({
    required String noteId,
    required bool newState,
  }) async {
    try {
      await dataSource.toggleCompleted(noteId: noteId, newState: newState);
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteNote({
    required String noteId,
  }) async {
    try {
      await dataSource.deleteNote(noteId: noteId);
      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
