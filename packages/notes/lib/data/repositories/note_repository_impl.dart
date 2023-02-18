import 'package:notes/data/datasources/remote/models/note_model.dart';
import 'package:notes/data/datasources/remote/note_remote_datasource.dart';
import 'package:notes/domain/entities/entities.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:redux_core/entities/entities.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource dataSource;

  const NoteRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Note> addNote({
    required NewNoteRequestModel request,
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
    required UpdateNoteRequestModel request,
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
      throw const NotFoundFailure();
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
