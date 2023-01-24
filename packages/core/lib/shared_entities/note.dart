import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const Note({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, description, isCompleted];

  Note copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
