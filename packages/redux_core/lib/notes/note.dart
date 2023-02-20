import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  factory Note({
    required String id,
    required String title,
    required String description,
    required bool isCompleted,
  }) = _Note;
}
