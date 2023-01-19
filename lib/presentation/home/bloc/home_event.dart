part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeStarted extends HomeEvent {}

class HomeAddNotePressed extends HomeEvent {}

class HomeToggleCompletedPressed extends HomeEvent {
  final String noteId;
  HomeToggleCompletedPressed({
    required this.noteId,
  });
}

class HomeNavEventHandled extends HomeEvent {}
