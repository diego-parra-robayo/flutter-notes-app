class NoteModel {
  final String id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  const NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  NoteModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
