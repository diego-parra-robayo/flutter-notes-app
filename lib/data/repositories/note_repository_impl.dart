import 'package:dartz/dartz.dart';
import 'package:todo/data/datasources/fake/mappers/note_model_mappers.dart';
import 'package:todo/data/datasources/fake/note_fake_datasource.dart';
import 'package:todo/domain/entities/new_note_request.dart';
import 'package:todo/domain/entities/note.dart';
import 'package:todo/domain/repositories/note_repository.dart';
import 'package:todo/utils/failure.dart';

import '../../domain/entities/update_note_request.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteFakeDataSource dataSource;

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
    } on Exception catch (e) {
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
    } on Exception catch (e) {
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
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotes() async {
    try {
      final notes = await dataSource.getNotes();
      return Right(notes.map((noteModel) => noteModel.toNote()).toList());
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleCompleted({
    required String noteId,
  }) async {
    try {
      await dataSource.toggleCompleted(noteId: noteId);
      return const Right(unit);
    } on Exception catch (e) {
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
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
