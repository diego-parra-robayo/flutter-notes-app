import 'package:equatable/equatable.dart';

class NewNoteRequestModel extends Equatable {
  final String title;
  final String description;

  const NewNoteRequestModel({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
