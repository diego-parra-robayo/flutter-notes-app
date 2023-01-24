import 'package:core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/add_note_usecase.dart';
import '../../../domain/usecases/get_note_usecase.dart';
import '../../../domain/usecases/update_note_usecase.dart';

part 'edit_note_bloc.freezed.dart';
part 'edit_note_event.dart';
part 'edit_note_nav_state.dart';
part 'edit_note_state.dart';

class EditNoteBloc extends Bloc<EditNoteEvent, EditNoteState> {
  final GetNoteUseCase getNoteUseCase;
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;

  EditNoteBloc({
    required this.getNoteUseCase,
    required this.addNoteUseCase,
    required this.updateNoteUseCase,
  }) : super(EditNoteState.initial()) {
    _onStarted();
    _onInputChanged();
    _onButtonPressed();
    _onEventHandled();
  }

  void _onStarted() {
    on<EditNoteStarted>((event, emit) async {
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
    on<EditNoteTitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<EditNoteDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
  }

  void _onButtonPressed() {
    on<EditNoteSaveButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final Either<Failure, Unit> resultOrFailure;
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
          popUpMessage: failure.message,
        )),
        (_) => emit(state.copyWith(
          isLoading: false,
          navState: EditNoteNavState.pop,
        )),
      );
    });
  }

  void _onEventHandled() {
    on<EditNoteNavEventHandled>((event, emit) {
      emit(state.copyWith(navState: null));
    });
    on<EditNotePopUpMessageShown>((event, emit) {
      emit(state.copyWith(popUpMessage: null));
    });
  }
}
