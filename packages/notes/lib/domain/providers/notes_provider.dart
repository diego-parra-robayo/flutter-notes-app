import 'dart:async';

import 'package:core/extensions/list_extensions.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/domain/entities/new_note_request.dart';

import '../entities/update_note_request.dart';
import '../repositories/note_repository.dart';

final notesProvider =
    AsyncNotifierProvider<NotesNotifier, List<Note>>(NotesNotifier.new);

class NotesNotifier extends AsyncNotifier<List<Note>> {
  late final NoteRepository repository;

  @override
  FutureOr<List<Note>> build() {
    repository = ref.watch(noteRepositoryProvider);
    return repository.getNotes();
  }

  Future refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.getNotes());
  }

  Future addNote(String title, String description) async {
    final currentNotes = List.of(state.valueOrNull ?? <Note>[]);
    state = const AsyncValue.loading();
    try {
      final addedNoteId = await repository.addNote(
        request: NewNoteRequest(
          title: title,
          description: description,
        ),
      );
      currentNotes.add(Note(
        id: addedNoteId,
        title: title,
        description: description,
        isCompleted: false,
      ));
      state = AsyncValue.data(currentNotes);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future deleteNote(String id) async {
    final currentNotes = List.of(state.valueOrNull ?? <Note>[]);
    state = const AsyncValue.loading();
    try {
      await repository.deleteNote(noteId: id);
      currentNotes.removeWhere((note) => note.id == id);
      state = AsyncValue.data(currentNotes);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future editNote(String id, String title, String description) async {
    final notes = List.of(state.valueOrNull ?? <Note>[]);
    state = const AsyncValue.loading();
    try {
      await repository.updateNote(
        request: UpdateNoteRequest(
          noteId: id,
          title: title,
          description: description,
        ),
      );
      final updated = notes.findAndReplace(
        find: (note) => note.id == id,
        replace: (note) => note.copyWith(
          title: title,
          description: description,
        ),
      );
      state = AsyncValue.data(updated);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future toggleCompletedState(String id) async {
    final notes = List.of(state.valueOrNull ?? <Note>[]);
    state = const AsyncValue.loading();
    try {
      final note = notes.firstOrNull((note) => note.id == id);
      if (note == null) return;
      final newState = !note.isCompleted;
      await repository.toggleCompleted(noteId: note.id, newState: newState);
      state = AsyncValue.data(notes.findAndReplace(
        find: (note) => note.id == id,
        replace: (note) => note.copyWith(isCompleted: newState),
      ));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
