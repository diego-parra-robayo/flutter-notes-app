import 'package:get_it/get_it.dart';
import 'package:todo/data/datasources/fake/note_fake_datasource.dart';
import 'package:todo/data/repositories/note_repository_impl.dart';
import 'package:todo/domain/repositories/note_repository.dart';
import 'package:todo/domain/usecases/add_note_usecase.dart';
import 'package:todo/domain/usecases/delete_note_usecase.dart';
import 'package:todo/domain/usecases/get_note_usecase.dart';
import 'package:todo/domain/usecases/get_notes_usecase.dart';
import 'package:todo/domain/usecases/toggle_note_completed_state_usecase.dart';
import 'package:todo/domain/usecases/update_note_usecase.dart';
import 'package:todo/presentation/edit_note/bloc/edit_note_bloc.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

class AppDi {
  static void init() {
    _registerDataSources();
    _registerRepositories();
    _registerUseCases();
    _registerBlocs();
  }

  static void _registerDataSources() {
    getIt.registerLazySingleton<NoteFakeDataSource>(
      () => NoteFakeDataSource(),
    );
  }

  static void _registerRepositories() {
    getIt.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(
        dataSource: getIt(),
      ),
    );
  }

  static void _registerUseCases() {
    getIt.registerFactory<AddNoteUseCase>(
      () => AddNoteUseCase(repository: getIt()),
    );
    getIt.registerFactory<UpdateNoteUseCase>(
      () => UpdateNoteUseCase(repository: getIt()),
    );
    getIt.registerFactory<GetNoteUseCase>(
      () => GetNoteUseCase(repository: getIt()),
    );
    getIt.registerFactory<GetNotesUseCase>(
      () => GetNotesUseCase(repository: getIt()),
    );
    getIt.registerFactory<ToggleNoteCompletedStateUseCase>(
      () => ToggleNoteCompletedStateUseCase(repository: getIt()),
    );
    getIt.registerFactory<DeleteNoteUseCase>(
      () => DeleteNoteUseCase(repository: getIt()),
    );
  }

  static void _registerBlocs() {
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(
        getNotesUseCase: getIt(),
        toggleNoteCompletedStateUseCase: getIt(),
        deleteNoteUseCase: getIt(),
      ),
    );
    getIt.registerFactory<EditNoteBloc>(
      () => EditNoteBloc(
        getNoteUseCase: getIt(),
        addNoteUseCase: getIt(),
        updateNoteUseCase: getIt(),
      ),
    );
  }
}
