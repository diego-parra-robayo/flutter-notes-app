import 'package:todo/data/datasources/remote/models/note_model.dart';
import 'package:todo/domain/entities/note.dart';

extension NodeModelMappers on NoteModel {
  Note toNote() => Note(
        id: id,
        description: description,
        isCompleted: isCompleted,
      );
}
