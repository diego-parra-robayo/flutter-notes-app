import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/data/datasources/remote/mappers/note_model_mappers.dart';

import '../../domain/entities/new_note_request.dart';
import '../../domain/entities/update_note_request.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/remote/note_remote_datasource.dart';

final noteRepositoryImplProvider = Provider(
  (ref) => NoteRepositoryImpl(
    dataSource: ref.read(noteRemoteDataSourceProvider),
  ),
);

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource dataSource;

  const NoteRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<String> addNote({
    required NewNoteRequest request,
  }) async {
    final newNoteId = await dataSource.addNote(
      title: request.title,
      description: request.description,
    );
    return newNoteId;
  }

  @override
  Future<void> updateNote({
    required UpdateNoteRequest request,
  }) =>
      dataSource.updateNote(
        noteId: request.noteId,
        title: request.title,
        description: request.description,
      );

  @override
  Future<Note> getNote({
    required String noteId,
  }) async {
    final noteModel = await dataSource.getNote(noteId: noteId);
    if (noteModel == null) throw NotFound();
    return noteModel.toNote();
  }

  @override
  Future<List<Note>> getNotes() async {
    final notes = await dataSource.getNotes();
    return notes.map((noteModel) => noteModel.toNote()).toList();
  }

  @override
  Future<void> toggleCompleted({
    required String noteId,
    required bool newState,
  }) => dataSource.toggleCompleted(noteId: noteId, newState: newState);

  @override
  Future<void> deleteNote({
    required String noteId,
  }) => dataSource.deleteNote(noteId: noteId);
}
