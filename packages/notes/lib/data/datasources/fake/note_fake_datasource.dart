import 'package:core/extensions/list_extensions.dart';

import 'dtos/note_dto.dart';

class NoteFakeDataSource {
  final List<NoteDto> _notes;
  final Duration delay;

  NoteFakeDataSource({
    List<NoteDto>? initialNotes,
    this.delay = const Duration(milliseconds: 1000),
  }) : _notes = initialNotes ?? _fakeNotes;

  Future<List<NoteDto>> getNotes() async {
    await Future.delayed(delay);
    return _notes;
  }

  Future<NoteDto?> getNote({required String noteId}) async {
    await Future.delayed(delay);
    return _notes.firstOrNull((note) => note.id == noteId);
  }

  Future<String> addNote({
    required String title,
    required String description,
  }) async {
    await Future.delayed(delay);
    final noteModel = NoteDto(
      id: _notes.length.toString(),
      title: title,
      description: description,
      isCompleted: false,
    );
    _notes.add(noteModel);
    return noteModel.id;
  }

  Future updateNote({
    required String noteId,
    required String title,
    required String description,
  }) async {
    await Future.delayed(delay);
    final noteIndex = _notes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;

    final updatedNote = _notes[noteIndex].copyWith(
      title: title,
      description: description,
    );
    _notes[noteIndex] = updatedNote;
  }

  Future toggleCompleted({
    required String noteId,
    required bool newState,
  }) async {
    final noteIndex = _notes.indexWhere((note) => note.id == noteId);
    if (noteIndex == -1) return;

    final updatedNote = _notes[noteIndex].copyWith(isCompleted: newState);
    _notes[noteIndex] = updatedNote;
  }

  Future deleteNote({
    required String noteId,
  }) async {
    _notes.removeWhere((note) => note.id == noteId);
  }
}

final _fakeNotes = [
  const NoteDto(
      id: '0',
      title: 'Complete Flutter app',
      description: '(No description)',
      isCompleted: false),
  const NoteDto(
    id: '1',
    title: 'Pay credit card',
    description: 'Bank',
    isCompleted: false,
  ),
  const NoteDto(
    id: '2',
    title: 'Buy groceries',
    description: 'Milk, eggs, ...',
    isCompleted: false,
  ),
];
