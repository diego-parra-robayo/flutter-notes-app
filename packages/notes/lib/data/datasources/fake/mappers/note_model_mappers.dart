import 'package:core/shared_entities/note.dart';

import '../models/note_model.dart';

extension NodeModelMappers on NoteModel {
  Note toNote() => Note(
        id: id,
        title: title ?? '',
        description: description ?? '',
        isCompleted: isCompleted ?? false,
      );
}
