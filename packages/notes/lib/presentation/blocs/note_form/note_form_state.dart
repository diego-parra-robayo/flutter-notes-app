part of 'note_form_bloc.dart';

@freezed
class NoteFormState with _$NoteFormState {
  factory NoteFormState({
    required bool isLoading,
    required String? popUpMessage,
    required String? noteId,
    required String title,
    required String description,
    required NoteFormResultState? result,
  }) = _NoteFormState;

  factory NoteFormState.initial() => NoteFormState(
        isLoading: false,
        popUpMessage: null,
        noteId: null,
        title: '',
        description: '',
        result: null,
      );
}

extension NoteFormStateExtensions on NoteFormState {
  bool get isSaveButtonEnabled =>
      !isLoading && title.isNotEmpty && description.isNotEmpty;
}


abstract class NoteFormResultState extends Equatable {
  const NoteFormResultState();
}

class NoteFormResultSuccess extends NoteFormResultState {
  @override
  List<Object?> get props => [];
}

class NoteFormResultFailure extends NoteFormResultState {
  final String message;

  const NoteFormResultFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

