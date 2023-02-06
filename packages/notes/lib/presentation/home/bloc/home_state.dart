part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required bool isLoading,
    required List<Note> notes,
    required String? errorMessage,
    required String? popUpMessage,
    required HomeNavState? navState,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        isLoading: false,
        notes: [],
        errorMessage: null,
        popUpMessage: null,
        navState: null,
      );
}

extension HomeStateExtensions on HomeState {
  String? breakingMessage(AppLocalizations l10n) =>
      errorMessage ??
      ((notes.isEmpty && !isLoading) ? l10n.emptyNotesListMessage : null);
}
