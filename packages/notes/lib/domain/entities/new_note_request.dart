import 'package:equatable/equatable.dart';

class NewNoteRequest extends Equatable {
  final String title;
  final String description;

  const NewNoteRequest({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
