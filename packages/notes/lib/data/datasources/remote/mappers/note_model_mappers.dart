import 'package:core/entities/note.dart';

import '../models/note_model.dart';

extension NodeModelMappers on NoteModel {
  Note toNote() => Note(
        id: id != null ? id! : throw Exception('note id can\'t be null'),
        title: title ?? '',
        description: description ?? '',
        isCompleted: isCompleted ?? false,
      );
}
