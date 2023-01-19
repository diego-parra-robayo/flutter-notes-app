class NoteModel {
  final String id;
  final String description;
  final bool isCompleted;

  const NoteModel({
    required this.id,
    required this.description,
    required this.isCompleted,
  });

  NoteModel copyWith({
    String? id,
    String? description,
    bool? isCompleted,
  }) {
    return NoteModel(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
