import 'package:core/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/new_note_request.dart';
import '../repositories/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  const AddNoteUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call({
    required String title,
    required String description,
  }) =>
      repository.addNote(
        request: NewNoteRequest(
          title: title,
          description: description,
        ),
      );
}
