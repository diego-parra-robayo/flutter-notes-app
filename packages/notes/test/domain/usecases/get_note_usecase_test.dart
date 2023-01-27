import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/get_note_usecase.dart';

import '../../fixtures/fake_notes.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late GetNoteUseCase sut;
  late NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = GetNoteUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repoResponse unmodified', () async {
      const noteId = '1';
      final Either<Failure, Note> repoResponse =
          Either.right(FakeNotes.fakeNote1);
      when(() => repository.getNote(noteId: noteId))
          .thenAnswer((_) async => repoResponse);

      final result = await sut(noteId: noteId);

      expect(result, repoResponse);
    });
  });
}
