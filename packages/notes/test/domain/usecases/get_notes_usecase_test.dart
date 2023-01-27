import 'package:core/failures/failure.dart';
import 'package:core/shared_entities/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/get_notes_usecase.dart';

import '../../fixtures/fake_notes.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late GetNotesUseCase sut;
  late NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = GetNotesUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repo response unchanged', () async {
      final Either<Failure, List<Note>> repoResponse =
          Either.right(FakeNotes.fakeNotes);
      when(() => repository.getNotes()).thenAnswer((_) async => repoResponse);

      final result = await sut();

      expect(result, repoResponse);
    });
  });
}
