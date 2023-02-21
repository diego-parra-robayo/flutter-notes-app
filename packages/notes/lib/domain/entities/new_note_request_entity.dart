import 'package:equatable/equatable.dart';

class NewNoteRequestEntity extends Equatable {
  final String title;
  final String description;

  const NewNoteRequestEntity({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
