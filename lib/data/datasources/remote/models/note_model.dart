import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel extends Equatable {
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

  Map<String, dynamic> toFirestore(SetOptions? options) => toJson();

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
