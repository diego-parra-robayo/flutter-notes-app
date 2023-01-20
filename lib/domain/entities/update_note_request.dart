class UpdateNoteRequest {
  final String noteId;
  final String title;
  final String description;

  const UpdateNoteRequest({
    required this.noteId,
    required this.title,
    required this.description,
  });
}
