import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/add_note_usecase.dart';

part 'add_note_bloc.freezed.dart';
part 'add_note_event.dart';
part 'add_note_nav_state.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  final AddNoteUseCase addNoteUseCase;

  AddNoteBloc({required this.addNoteUseCase}) : super(AddNoteState.initial()) {
    _onInputChanged();
    _onButtonPressed();
    _onEventHandled();
  }

  void _onInputChanged() {
    on<AddNoteTitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<AddNoteDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
  }

  void _onButtonPressed() {
    on<AddNoteSaveButtonPressed>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final addedOrFailure = await addNoteUseCase(
        title: state.title,
        description: state.description,
      );
      addedOrFailure.fold(
        (failure) => emit(state.copyWith(
          isLoading: false,
          popUpMessage: failure.message,
        )),
        (_) => emit(state.copyWith(
          isLoading: false,
          navState: AddNoteNavState.pop,
        )),
      );
    });
  }

  void _onEventHandled() {
    on<AddNoteNavEventHandled>((event, emit) {
      emit(state.copyWith(navState: null));
    });
    on<AddNotePopUpMessageShown>((event, emit) {
      emit(state.copyWith(popUpMessage: null));
    });
  }
}
