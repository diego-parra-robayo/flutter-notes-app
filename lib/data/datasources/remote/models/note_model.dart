import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable(includeIfNull: false)
class NoteModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final bool? isCompleted;
  final dynamic createdAt;
  final dynamic updatedAt;

  const NoteModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  factory NoteModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      NoteModel.fromJson({
        ...snapshot.data()!,
        'id': snapshot.id,
      });

  Map<String, dynamic> toFirestore(SetOptions? options) => {
        'updatedAt': FieldValue.serverTimestamp(),
        ...toJson(),
      };

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

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}
