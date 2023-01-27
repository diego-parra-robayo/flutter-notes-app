import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/entities/update_note_request.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/update_note_usecase.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late UpdateNoteUseCase sut;
  late NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = UpdateNoteUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repo response unchanged', () async {
      final Either<Failure, Unit> repoResponse = Either.right(unit);
      const noteId = '1';
      const title = 'new title';
      const description = 'new description';

      when(
        () => repository.updateNote(
          request: const UpdateNoteRequest(
            noteId: noteId,
            title: title,
            description: description,
          ),
        ),
      ).thenAnswer((_) async => repoResponse);

      final result = await sut(
        noteId: noteId,
        title: title,
        description: description,
      );

      expect(result, repoResponse);
    });
  });
}
