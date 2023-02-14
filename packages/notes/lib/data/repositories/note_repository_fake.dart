import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:notes/data/datasources/fake/mappers/note_model_mappers.dart';

import '../../domain/entities/new_note_request.dart';
import '../../domain/entities/update_note_request.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/fake/note_fake_datasource.dart';

class NoteRepositoryFake implements NoteRepository {
  final NoteFakeDataSource dataSource;

  const NoteRepositoryFake({
    required this.dataSource,
  });

  @override
  Future<Note> addNote({
    required NewNoteRequest request,
  }) async {
    final id = await dataSource.addNote(
      title: request.title,
      description: request.description,
    );
    return Note(
      id: id,
      title: request.title,
      description: request.description,
      isCompleted: false,
    );
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
      throw const NotFound();
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
