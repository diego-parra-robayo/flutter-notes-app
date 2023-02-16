import 'package:core/extensions/list_extensions.dart';
import 'package:core/entities/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locale/generated/app_localizations.dart';

import '../../../domain/usecases/delete_note_middleware.dart';
import '../../../domain/usecases/get_notes_middleware.dart';
import '../../../domain/usecases/toggle_note_completed_middleware.dart';

part 'notes_bloc.freezed.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase getNotesUseCase;
  final ToggleNoteCompletedStateUseCase toggleNoteCompletedStateUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  NotesBloc({
    required this.getNotesUseCase,
    required this.toggleNoteCompletedStateUseCase,
    required this.deleteNoteUseCase,
  }) : super(NotesState.initial()) {
    _onStarted();
    _onButtonPressed();
    _onEventHandled();
  }

  void _onStarted() {
    on<NotesStarted>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final notesOrFailure = await getNotesUseCase();
      notesOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        )),
        (notes) => emit(state.copyWith(
          isLoading: false,
          notes: notes,
        )),
      );
    });
  }

  void _onButtonPressed() {
    on<NotesToggleNoteCompletedPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final currentList = state.notes;
      final note = currentList.firstOrNull((note) => note.id == event.noteId);
      if (note == null) return;
      final updateOrFailure = await toggleNoteCompletedStateUseCase(
        noteId: event.noteId,
        newState: !note.isCompleted,
      );
      updateOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          popUpMessage: failure.message,
        )),
        (_) {
          final updatedList = currentList.findAndReplace(
            find: (note) => note.id == event.noteId,
            replace: (note) => note.copyWith(isCompleted: !note.isCompleted),
          );
          emit(state.copyWith(isLoading: false, notes: updatedList));
        },
      );
    });
    on<NotesDeleteNotePressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final deletedOrFailure = await deleteNoteUseCase(noteId: event.noteId);
      deletedOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          popUpMessage: failure.message,
        )),
        (_) {
          final newList = List.of(state.notes);
          newList.removeWhere((note) => note.id == event.noteId);
          emit(state.copyWith(
            isLoading: false,
            notes: newList,
            popUpMessage: event.l10n.deletedNoteMessage,
          ));
        },
      );
    });
  }

  void _onEventHandled() {
    on<NotesPopUpMessageShown>(
      (event, emit) => emit(state.copyWith(popUpMessage: null)),
    );
  }
}
