part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required bool isLoading,
    required List<Note> notes,
    required String? errorMessage,
    required HomeNavState? navState,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        isLoading: false,
        notes: [],
        errorMessage: null,
        navState: null,
      );
}
