import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/entities/new_note_request.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:notes/domain/usecases/add_note_usecase.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late AddNoteUseCase sut;
  late NoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = AddNoteUseCase(repository: repository);
  });

  group('call', () {
    test('when call is invoked, return repo response unchanged', () async {
      const title = 'new title';
      const description = 'new description';
      final Either<Failure, Unit> repoResponse = Either.right(unit);
      when(
        () => repository.addNote(
          request: const NewNoteRequest(
            title: title,
            description: description,
          ),
        ),
      ).thenAnswer((_) async => repoResponse);

      final result = await sut(title: title, description: description);

      expect(result, repoResponse);
    });
  });
}
