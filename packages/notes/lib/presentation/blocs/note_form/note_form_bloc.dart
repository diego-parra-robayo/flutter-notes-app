import 'package:core/failures/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/add_note_middleware.dart';
import '../../../domain/usecases/get_note_details_middleware.dart';
import '../../../domain/usecases/update_note_middleware.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_state.dart';
part 'note_form_event.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final GetNoteUseCase getNoteUseCase;
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  NoteFormBloc({
    required this.getNoteUseCase,
    required this.addNoteUseCase,
    required this.updateNoteUseCase,
  }) : super(NoteFormState.initial()) {
    _onStarted();
    _onInputChanged();
    _onButtonPressed();
    _onEventHandled();
  }

  void _onStarted() {
    on<NoteFormStarted>((event, emit) async {
      final noteId = event.noteId;
      emit(state.copyWith(noteId: noteId));

      if (noteId == null) return;
      emit(state.copyWith(isLoading: true));
      final noteOrFailure = await getNoteUseCase(noteId: noteId);
      noteOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          popUpMessage: failure.message,
        )),
        (note) => emit(state.copyWith(
          isLoading: false,
          title: note.title,
          description: note.description,
        )),
      );
    });
  }

  void _onInputChanged() {
    on<NoteFormTitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<NoteFormDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
  }

  void _onButtonPressed() {
    on<NoteFormSaveButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final Either<Failure, dynamic> resultOrFailure;
      if (state.noteId != null) {
        resultOrFailure = await updateNoteUseCase(
          noteId: state.noteId!,
          title: state.title,
          description: state.description,
        );
      } else {
        resultOrFailure = await addNoteUseCase(
          title: state.title,
          description: state.description,
        );
      }
      resultOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          result: NoteFormResultFailure(message: failure.message),
        )),
        (_) => emit(state.copyWith(
          isLoading: false,
          result: NoteFormResultSuccess(),
        )),
      );
    });
  }

  void _onEventHandled() {
    on<NoteFormPopUpMessageShown>((event, emit) {
      emit(state.copyWith(popUpMessage: null));
    });
    on<NoteFormResultHandled>((event, emit) {
      emit(state.copyWith(result: null));
    });
  }
}
