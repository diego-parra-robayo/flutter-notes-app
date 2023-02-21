import 'package:notes/domain/entities/new_note_request_entity.dart';
import 'package:notes/domain/entities/update_note_request_entity.dart';
import 'package:redux_core/notes/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<List<Note>> getNotesByUser({
    required String userId,
  });

  Future<Note> getNote({
    required String noteId,
  });

  Future<Note> addNote({
    required NewNoteRequestEntity request,
  });

  Future<void> updateNote({
    required UpdateNoteRequestEntity request,
  });

  Future<void> toggleCompleted({
    required String noteId,
    required bool newState,
  });

  Future<void> deleteNote({
    required String noteId,
  });
}
