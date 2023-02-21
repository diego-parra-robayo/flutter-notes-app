import 'package:equatable/equatable.dart';

class UpdateNoteRequestEntity extends Equatable {
  final String noteId;
  final String title;
  final String description;

  const UpdateNoteRequestEntity({
    required this.noteId,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [noteId, title, description];
}
