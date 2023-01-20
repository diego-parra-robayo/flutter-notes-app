import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/note_model.dart';

class NoteRemoteDatasource {
  late final CollectionReference notesRef;

  NoteRemoteDatasource({
    required FirebaseFirestore database,
  }) {
    notesRef = database.collection('notes').withConverter<NoteModel>(
          fromFirestore: NoteModel.fromFirestore,
          toFirestore: (note, options) => note.toFirestore(options),
        );
  }

  Future<List<NoteModel>> getNotes() async {
    final querySnapshot = await notesRef.get();
    return querySnapshot.docs.map((doc) => doc.data() as NoteModel).toList();
  }

  Future<NoteModel?> getNote({required String noteId}) async {
    throw UnimplementedError();
  }

  Future addNote({
    required String title,
    required String description,
  }) async {
    throw UnimplementedError();
  }

  Future updateNote({
    required String noteId,
    required String title,
    required String description,
  }) async {
    throw UnimplementedError();
  }

  Future toggleCompleted({
    required String noteId,
  }) async {
    throw UnimplementedError();
  }

  Future deleteNote({
    required String noteId,
  }) async {
    throw UnimplementedError();
  }
}
