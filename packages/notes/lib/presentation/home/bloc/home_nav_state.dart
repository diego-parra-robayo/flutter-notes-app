part of 'home_bloc.dart';

abstract class HomeNavState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeNavToAddNote extends HomeNavState {}

class HomeNavToEditNote extends HomeNavState {
  final String noteId;

  HomeNavToEditNote({required this.noteId});

  @override
  List<Object> get props => [noteId];
}
