import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/di/di_schema.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/data/datasources/fake/note_fake_datasource.dart';
import 'package:notes/data/datasources/remote/note_remote_datasource.dart';
import 'package:notes/data/repositories/note_repository_impl.dart';
import 'package:notes/domain/middlewares/get_my_notes_middleware.dart';
import 'package:notes/domain/middlewares/middlewares.dart';
import 'package:notes/domain/repositories/note_repository.dart';
import 'package:redux_core/redux_core.dart';
import 'package:redux_core/store/app_state.dart';

class NotesDi extends DiSchema {
  static NotesDi get instance => GetIt.instance.get();

  final void Function(Store<AppState> store) onSignOut;
  final void Function(BuildContext context) onSignedOut;

  NotesDi({
    required this.onSignOut,
    required this.onSignedOut,
  });

  @override
  void registerDataSources() {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<NoteRemoteDatasource>(
      () => NoteRemoteDatasource(database: getIt()),
    );
    getIt.registerLazySingleton<NoteFakeDataSource>(
      () => NoteFakeDataSource(),
    );
  }

  @override
  void registerRepositories() {
    getIt.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(
        dataSource: getIt(),
      ),
    );
  }

  @override
  void registerMiddlewares() {
    getIt.registerLazySingleton<List<Middleware<AppState>>>(
      () => [
        AddNoteMiddleware(repository: getIt()),
        DeleteNoteMiddleware(repository: getIt()),
        GetNoteDetailsMiddleware(repository: getIt()),
        GetNotesMiddleware(repository: getIt()),
        GetMyNotesMiddleware(repository: getIt()),
        ToggleNoteCompletedMiddleware(repository: getIt()),
        UpdateNoteMiddleware(repository: getIt()),
      ],
      instanceName: middlewaresKey,
    );
  }

  List<Middleware<AppState>> get middlewares =>
      getIt(instanceName: middlewaresKey);
}
