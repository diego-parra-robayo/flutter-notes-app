import 'package:core/entities/note.dart';

import '../entities/new_note_request.dart';
import '../entities/update_note_request.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNote({
    required String noteId,
  });

  Future<Note> addNote({
    required NewNoteRequest request,
  });

  Future<void> updateNote({
    required UpdateNoteRequest request,
  });

  Future<void> toggleCompleted({
    required String noteId,
    required bool newState,
  });

  Future<void> deleteNote({
    required String noteId,
  });
}
