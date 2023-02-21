import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redux_core/notes/note.dart';

part 'note_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class NoteDto extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final dynamic createdAt;
  final dynamic updatedAt;

  const NoteDto({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];

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

extension NoteModelFirestoreX on NoteDto {
  static NoteDto fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      NoteDto.fromJson({
        ...snapshot.data()!,
        'id': snapshot.id,
      });

  Map<String, dynamic> toFirestore(SetOptions? options) => {
        'updatedAt': FieldValue.serverTimestamp(),
        ...toJson(),
      };
}

extension NoteModelDomainX on NoteDto {
  Note toNote() => Note(
        id: id != null ? id! : throw Exception('note id can\'t be null'),
        title: title ?? '',
        description: description ?? '',
        isCompleted: isCompleted ?? false,
      );
}
