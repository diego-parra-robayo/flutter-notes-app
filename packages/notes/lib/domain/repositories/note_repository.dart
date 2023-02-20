import 'package:notes/domain/entities/entities.dart';
import 'package:redux_core/notes/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNote({
    required String noteId,
  });

  Future<Note> addNote({
    required NewNoteRequestModel request,
  });

  Future<void> updateNote({
    required UpdateNoteRequestModel request,
  });

  Future<void> toggleCompleted({
    required String noteId,
    required bool newState,
  });

  Future<void> deleteNote({
    required String noteId,
  });
}
