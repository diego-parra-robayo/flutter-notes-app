import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/toggle_note_completed_state_usecase.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late ToggleNoteCompletedStateUseCase sut;
  late NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = ToggleNoteCompletedStateUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repo response unchanged', () async {
      final Either<Failure, Unit> repoResponse = Either.right(unit);
      const noteId = '1';
      const newState = true;
      when(() => repository.toggleCompleted(noteId: noteId, newState: newState))
          .thenAnswer((_) async => repoResponse);

      final result = await sut(noteId: noteId, newState: newState);

      expect(result, repoResponse);
    });
  });
}
