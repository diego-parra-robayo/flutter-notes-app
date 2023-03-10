import 'package:equatable/equatable.dart';
import 'package:redux_core/notes/note.dart';

class NoteDto extends Equatable {
  final String id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const NoteDto({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted];

  NoteDto copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return NoteDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

extension NoteModelDomainX on NoteDto {
  Note toNote() => Note(
        id: id,
        title: title ?? '',
        description: description ?? '',
        isCompleted: isCompleted ?? false,
      );
}
