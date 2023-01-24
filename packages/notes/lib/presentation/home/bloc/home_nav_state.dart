part of 'home_bloc.dart';

abstract class HomeNavState {}

class HomeNavToAddNote extends HomeNavState {}

class HomeNavToEditNote extends HomeNavState {
  final String noteId;
  HomeNavToEditNote({required this.noteId});
}
