import 'package:core/extensions/list_extensions.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/domain/providers/notes_provider.dart';
import 'package:notes/domain/repositories/note_repository.dart';

final noteProvider = FutureProvider.family<Note, String>((ref, id) async {
  final notes = ref.watch(notesProvider).valueOrNull;
  final note = notes?.firstOrNull((note) => note.id == id);
  if(note != null) return note;

  final repository = ref.watch(noteRepositoryProvider);
  return await repository.getNote(noteId: id);
});