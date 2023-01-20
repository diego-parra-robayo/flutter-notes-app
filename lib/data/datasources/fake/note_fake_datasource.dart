import 'package:todo/utils/extensions/list_extensions.dart';
import 'package:todo/utils/uuid.dart';

import 'models/note_model.dart';

class NoteFakeDataSource {
  final List<NoteModel> _notes;
  final Duration delay;

  NoteFakeDataSource({
    List<NoteModel>? initialNotes,
    this.delay = const Duration(milliseconds: 2000),
  }) : _notes = initialNotes ?? _fakeNotes;

  Future<List<NoteModel>> getNotes() async {
    await Future.delayed(delay);
    return _notes;
  }

  Future<NoteModel?> getNote({required String noteId}) async {
    await Future.delayed(delay);
    return _notes.firstOrNull((note) => note.id == noteId);
  }

  Future addNote({
    required String title,
    required String description,
  }) async {
    await Future.delayed(delay);
    _notes.add(
      NoteModel(
        id: UUID.getUniqueId(),
        title: title,
        description: description,
        isCompleted: false,
      ),
    );
  }

  Future toggleCompleted({
    required String noteId,
  }) async {
    final noteIndex = _notes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;

    final updatedNote = _notes[noteIndex].copyWith(isCompleted: true);
    _notes[noteIndex] = updatedNote;
  }

  Future deleteNote({
    required String noteId,
  }) async {
    _notes.removeWhere((note) => note.id == noteId);
  }
}

final _fakeNotes = [
  const NoteModel(
      id: '1',
      title: 'Complete Flutter app',
      description: '(No description)',
      isCompleted: false),
  const NoteModel(
    id: '2',
    title: 'Pay credit card',
    description: 'Bank',
    isCompleted: false,
  ),
  const NoteModel(
    id: '3',
    title: 'Buy groceries',
    description: 'Milk, eggs, ...',
    isCompleted: false,
  ),
];
