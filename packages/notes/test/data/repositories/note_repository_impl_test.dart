import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/data/datasources/remote/models/note_model.dart';
import 'package:notes/data/datasources/remote/note_remote_datasource.dart';
import 'package:notes/data/repositories/note_repository_impl.dart';
import 'package:notes/domain/entities/new_note_request.dart';
import 'package:notes/domain/entities/update_note_request.dart';

import '../../fixtures/fake_notes.dart';

class MockNoteDataSource extends Mock implements NoteRemoteDatasource {}

void main() {
  late NoteRepositoryImpl sut;
  late NoteRemoteDatasource dataSource;

  setUp(() {
    dataSource = MockNoteDataSource();
    sut = NoteRepositoryImpl(dataSource: dataSource);
  });

  group('addNote', () {
    const title = 'new title';
    const description = 'new description';
    final error = Exception('Couldn\'t add note');

    test(
      'when dataSource add note successfully, return either right',
      () async {
        when(
          () => dataSource.addNote(title: title, description: description),
        ).thenAnswer((_) async {});

        final result = await sut.addNote(
          request: const NewNoteRequest(
            title: title,
            description: description,
          ),
        );

        expect(result.isRight(), true);
      },
    );
    test(
      'when dataSource throws an error adding a note, return either left with ApiFailure',
      () async {
        when(
          () => dataSource.addNote(title: title, description: description),
        ).thenThrow(error);

        final result = await sut.addNote(
          request: const NewNoteRequest(
            title: title,
            description: description,
          ),
        );

        expect(result.isLeft(), true);
        expect(result.leftOrNull(), ApiFailure(error.toString()));
      },
    );
  });

  group('updateNote', () {
    const noteId = '1';
    const title = 'updated title';
    const description = 'updated description';
    final error = Exception('Couldn\'t update note');

    test('when dataSource updates successfully, return either right', () async {
      when(() => dataSource.updateNote(
          noteId: noteId,
          title: title,
          description: description)).thenAnswer((_) async {});
      final result = await sut.updateNote(
          request: const UpdateNoteRequest(
              noteId: noteId, title: title, description: description));
      expect(result.isRight(), true);
    });
    test('when dataSource throws error, return either left', () async {
      when(() => dataSource.updateNote(
          noteId: noteId,
          title: title,
          description: description)).thenThrow(error);
      final result = await sut.updateNote(
          request: const UpdateNoteRequest(
              noteId: noteId, title: title, description: description));
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), ApiFailure(error.toString()));
    });
  });

  group('getNote', () {
    const note = FakeNotes.fakeNote1;
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
      isCompleted: note.isCompleted,
    );
    final noteId = note.id;
    final error = Exception('Couldn\'t get note');

    test('when dataSource get note successfully, return either right',
        () async {
      when(() => dataSource.getNote(noteId: noteId))
          .thenAnswer((_) async => noteModel);
      final result = await sut.getNote(noteId: noteId);
      expect(result.isRight(), true);
      expect(result.rightOrNull(), note);
    });
    test('when dataSource returns a null object, return either left not found',
        () async {
      when(() => dataSource.getNote(noteId: noteId))
          .thenAnswer((_) async => null);
      final result = await sut.getNote(noteId: noteId);
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), const NotFound());
    });
    test('when dataSource throws error, return either left', () async {
      when(() => dataSource.getNote(noteId: noteId)).thenThrow(error);
      final result = await sut.getNote(noteId: noteId);
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), ApiFailure(error.toString()));
    });
  });

  group('getNotes', () {
    const note1 = FakeNotes.fakeNote1;
    const note2 = FakeNotes.fakeNote2;
    const notes = [note1, note2];
    final noteModel1 = NoteModel(
      id: note1.id,
      title: note1.title,
      description: note1.description,
      isCompleted: note1.isCompleted,
    );
    final noteModel2 = NoteModel(
      id: note2.id,
      title: note2.title,
      description: note2.description,
      isCompleted: note2.isCompleted,
    );
    final noteModels = [noteModel1, noteModel2];
    final error = Exception('Couldn\'t get note');

    test('when dataSource get notes successfully, return either right',
        () async {
      when(() => dataSource.getNotes()).thenAnswer((_) async => noteModels);
      final result = await sut.getNotes();
      expect(result.isRight(), true);
      expect(result.rightOrNull(), notes);
    });
    test('when dataSource throws error, return either left', () async {
      when(() => dataSource.getNotes()).thenThrow(error);
      final result = await sut.getNotes();
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), ApiFailure(error.toString()));
    });
  });

  group('toggleCompleted', () {
    const noteId = '1';
    const newState = true;
    final error = Exception('Couldn\'t get note');

    test('when dataSource operates successfully, return either right',
        () async {
      when(() => dataSource.toggleCompleted(noteId: noteId, newState: newState))
          .thenAnswer((_) async {});
      final result = await sut.toggleCompleted(noteId: noteId, newState: newState);
      expect(result.isRight(), true);
    });
    test('when dataSource throws error, return either left', () async {
      when(() => dataSource.toggleCompleted(noteId: noteId, newState: newState)).thenThrow(error);
      final result = await sut.toggleCompleted(noteId: noteId, newState: newState);
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), ApiFailure(error.toString()));
    });
  });

  group('deleteNote', () {
    const noteId = '1';
    final error = Exception('Couldn\'t get note');

    test('when dataSource operates successfully, return either right',
            () async {
          when(() => dataSource.deleteNote(noteId: noteId))
              .thenAnswer((_) async {});
          final result = await sut.deleteNote(noteId: noteId);
          expect(result.isRight(), true);
        });
    test('when dataSource throws error, return either left', () async {
      when(() => dataSource.deleteNote(noteId: noteId)).thenThrow(error);
      final result = await sut.deleteNote(noteId: noteId);
      expect(result.isLeft(), true);
      expect(result.leftOrNull(), ApiFailure(error.toString()));
    });
  });
}
