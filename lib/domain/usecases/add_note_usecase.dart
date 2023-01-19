import 'package:dartz/dartz.dart';
import 'package:todo/domain/entities/new_note_request.dart';
import 'package:todo/domain/repositories/note_repository.dart';
import 'package:todo/utils/failure.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  const AddNoteUseCase({
    required this.repository,
  });

  Future<Either<Failure, Unit>> call({
    required String description,
  }) =>
      repository.addNote(request: NewNoteRequest(description: description));
}
