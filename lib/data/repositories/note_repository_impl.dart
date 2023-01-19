import 'package:dartz/dartz.dart';
import 'package:todo/data/datasources/remote/mappers/note_model_mappers.dart';
import 'package:todo/data/datasources/remote/note_remote_datasource.dart';
import 'package:todo/domain/entities/new_note_request.dart';
import 'package:todo/domain/entities/note.dart';
import 'package:todo/domain/repositories/note_repository.dart';
import 'package:todo/utils/failure.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource remoteDataSource;

  const NoteRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> addNote({
    required NewNoteRequest request,
  }) async {
    try {
      await remoteDataSource.addNote(description: request.description);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> getNote({required String noteId}) async {
    try {
      final noteModel = await remoteDataSource.getNote(noteId: noteId);
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
      final notes = await remoteDataSource.getNotes();
      return Right(notes.map((noteModel) => noteModel.toNote()).toList());
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleCompleted(
      {required String noteId}) async {
    try {
      await remoteDataSource.toggleCompleted(noteId: noteId);
      return const Right(unit);
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
