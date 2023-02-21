import 'package:cloud_firestore/cloud_firestore.dart';

import 'dtos/note_dto.dart';

class NoteRemoteDatasource {
  late final CollectionReference notesRef;

  NoteRemoteDatasource({
    required FirebaseFirestore database,
  }) {
    notesRef = database.collection('notes').withConverter<NoteDto>(
          fromFirestore: NoteModelFirestoreX.fromFirestore,
          toFirestore: (note, options) => note.toFirestore(options),
        );
  }

  Future<List<NoteDto>> getNotes() async {
    final querySnapshot =
        await notesRef.orderBy('createdAt', descending: false).get();
    return querySnapshot.docs.map((doc) => doc.data() as NoteDto).toList();
  }

  Future<List<NoteDto>> getNotesByUser({required String userId}) async {
    final querySnapshot = await notesRef
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: false)
        .get();
    return querySnapshot.docs.map((doc) => doc.data() as NoteDto).toList();
  }

  Future<NoteDto?> getNote({required String noteId}) async {
    final docSnapshot = await notesRef.doc(noteId).get();
    return docSnapshot.data() as NoteDto?;
  }

  Future<String> addNote({
    required String userId,
    required String title,
    required String description,
  }) async {
    final docRef = await notesRef.add(
      NoteDto(
        userId: userId,
        title: title,
        description: description,
        isCompleted: false,
        createdAt: FieldValue.serverTimestamp(),
      ),
    );
    return docRef.id;
  }

  Future updateNote({
    required String noteId,
    required String title,
    required String description,
  }) =>
      notesRef.doc(noteId).set(
            NoteDto(title: title, description: description),
            SetOptions(merge: true),
          );

  Future toggleCompleted({
    required String noteId,
    required bool newState,
  }) =>
      notesRef.doc(noteId).set(
            NoteDto(isCompleted: newState),
            SetOptions(merge: true),
          );

  Future deleteNote({
    required String noteId,
  }) =>
      notesRef.doc(noteId).delete();
}
