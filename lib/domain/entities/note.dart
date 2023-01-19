import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String description;
  final bool isCompleted;

  const Note({
    required this.id,
    required this.description,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, description, isCompleted];

  Note copyWith({
    String? id,
    String? description,
    bool? isCompleted,
  }) {
    return Note(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
