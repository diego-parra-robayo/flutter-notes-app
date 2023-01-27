import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/data/datasources/fake/mappers/note_model_mappers.dart';

import '../../domain/entities/new_note_request.dart';
import '../../domain/entities/update_note_request.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/fake/note_fake_datasource.dart';

final noteFakeRepositoryProvider = Provider(
  (ref) => NoteRepositoryFake(dataSource: ref.read(noteFakeDataSourceProvider)),
);

class NoteRepositoryFake implements NoteRepository {
  final NoteFakeDataSource dataSource;

  const NoteRepositoryFake({
    required this.dataSource,
  });

  @override
  Future<String> addNote({
    required NewNoteRequest request,
  }) async {
    final addedNoteId = await dataSource.addNote(
      title: request.title,
      description: request.description,
    );
    return addedNoteId;
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
    if (noteModel != null) {
      return noteModel.toNote();
    } else {
      return throw NotFound();
    }
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
  }) =>
      dataSource.toggleCompleted(noteId: noteId, newState: newState);

  @override
  Future<void> deleteNote({
    required String noteId,
  }) =>
      dataSource.deleteNote(noteId: noteId);
}
