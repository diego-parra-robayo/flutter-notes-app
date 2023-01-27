import 'package:core/shared_entities/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/data/repositories/note_repository_impl.dart';

import '../entities/new_note_request.dart';
import '../entities/update_note_request.dart';

final Provider<NoteRepository> noteRepositoryProvider = Provider(
  (ref) => ref.read(noteRepositoryImplProvider),
);

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNote({
    required String noteId,
  });

  Future<String> addNote({
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
