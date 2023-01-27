import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firestoreProvider.dart';
import 'models/note_model.dart';

final noteRemoteDataSourceProvider = Provider(
  (ref) => NoteRemoteDatasource(database: ref.read(firestoreProvider)),
);

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
    final querySnapshot = await notesRef
        .orderBy(
          'createdAt',
          descending: false,
        )
        .get();
    return querySnapshot.docs.map((doc) => doc.data() as NoteModel).toList();
  }

  Future<NoteModel?> getNote({required String noteId}) async {
    final docSnapshot = await notesRef.doc(noteId).get();
    return docSnapshot.data() as NoteModel?;
  }

  Future<String> addNote({
    required String title,
    required String description,
  }) async {
    final addedResult = await notesRef.add(
      NoteModel(
        title: title,
        description: description,
        isCompleted: false,
        createdAt: FieldValue.serverTimestamp(),
      ),
    );
    return addedResult.id;
  }

  Future updateNote({
    required String noteId,
    required String title,
    required String description,
  }) =>
      notesRef.doc(noteId).set(
            NoteModel(title: title, description: description),
            SetOptions(merge: true),
          );

  Future toggleCompleted({
    required String noteId,
    required bool newState,
  }) =>
      notesRef.doc(noteId).set(
            NoteModel(isCompleted: newState),
            SetOptions(merge: true),
          );

  Future deleteNote({
    required String noteId,
  }) =>
      notesRef.doc(noteId).delete();
}
