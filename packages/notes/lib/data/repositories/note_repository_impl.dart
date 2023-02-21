import 'package:notes/data/datasources/remote/dtos/note_dto.dart';
import 'package:notes/data/datasources/remote/note_remote_datasource.dart';
import 'package:notes/domain/entities/new_note_request_entity.dart';
import 'package:notes/domain/entities/update_note_request_entity.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:redux_core/failure/failure.dart';
import 'package:redux_core/notes/note.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDatasource dataSource;

  const NoteRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Note> addNote({
    required NewNoteRequestEntity request,
  }) async {
    final id = await dataSource.addNote(
      userId: request.userId,
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
    required UpdateNoteRequestEntity request,
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
    final noteDto = await dataSource.getNote(noteId: noteId);
    if (noteDto != null) {
      return noteDto.toNote();
    } else {
      throw const NotFoundFailure();
    }
  }

  @override
  Future<List<Note>> getNotes() async {
    final notes = await dataSource.getNotes();
    return notes.map((noteDto) => noteDto.toNote()).toList();
  }

  @override
  Future<List<Note>> getNotesByUser({required String userId}) async {
    final notes = await dataSource.getNotesByUser(userId: userId);
    return notes.map((noteDto) => noteDto.toNote()).toList();
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
