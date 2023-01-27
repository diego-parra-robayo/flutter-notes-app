import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/delete_note_usecase.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late final DeleteNoteUseCase sut;
  late final NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = DeleteNoteUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repo response unmodified', () async {
      const noteId = '1';
      final Either<Failure, Unit> repoResponse = Either.right(unit);
      when(() => repository.deleteNote(noteId: noteId))
          .thenAnswer((_) async => repoResponse);

      final result = await sut(noteId: noteId);

      expect(result, repoResponse);
    });
  });
}
