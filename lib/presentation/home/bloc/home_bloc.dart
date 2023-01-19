import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo/utils/extensions/list_extensions.dart';

import '../../../domain/entities/note.dart';
import '../../../domain/usecases/get_notes_usecase.dart';
import '../../../domain/usecases/toggle_note_completed_state_usecase.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_nav_state.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNotesUseCase getNotesUseCase;
  final ToggleNoteCompletedStateUseCase toggleNoteCompletedStateUseCase;

  HomeBloc({
    required this.getNotesUseCase,
    required this.toggleNoteCompletedStateUseCase,
  }) : super(HomeState.initial()) {
    _onStarted();
    _onButtonPressed();
    _onEventHandled();
  }

  void _onStarted() {
    on<HomeStarted>((event, emit) async {
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
    on<HomeAddNotePressed>((event, emit) async {
      emit(state.copyWith(navState: HomeNavState.add));
    });
    on<HomeToggleCompletedPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final updateOrFailure = await toggleNoteCompletedStateUseCase(
        noteId: event.noteId,
      );
      updateOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        )),
        (_) {
          final currentList = state.notes;
          final updatedList = currentList.findAndReplace(
            find: (note) => note.id == event.noteId,
            replace: (note) => note.copyWith(isCompleted: !note.isCompleted),
          );
          emit(state.copyWith(isLoading: false, notes: updatedList));
        },
      );
    });
  }

  void _onEventHandled() {
    on<HomeNavEventHandled>(
      (event, emit) => emit(state.copyWith(navState: null)),
    );
  }
}
