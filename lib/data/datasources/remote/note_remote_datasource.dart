import 'package:todo/utils/list_extensions.dart';
import 'package:todo/utils/uuid.dart';

import 'models/note_model.dart';

class NoteRemoteDataSource {
  final List<NoteModel> _notes;

  const NoteRemoteDataSource({
    List<NoteModel>? initialNotes,
  }) : _notes = initialNotes ?? const [];

  Future<List<NoteModel>> getNotes() async => _notes;

  Future<NoteModel?> getNote({required String noteId}) async =>
      _notes.firstOrNull((note) => note.id == noteId);

  Future addNote({
    required String description,
  }) async {
    _notes.add(
      NoteModel(
        id: UUID.getUniqueId(),
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
}
