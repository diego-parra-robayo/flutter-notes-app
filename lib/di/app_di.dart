import 'package:get_it/get_it.dart';
import 'package:todo/data/datasources/remote/note_remote_datasource.dart';
import 'package:todo/data/repositories/note_repository_impl.dart';
import 'package:todo/domain/repositories/note_repository.dart';
import 'package:todo/domain/usecases/add_note_usecase.dart';
import 'package:todo/domain/usecases/get_note_usecase.dart';
import 'package:todo/domain/usecases/get_notes_usecase.dart';
import 'package:todo/domain/usecases/toggle_note_completed_state_usecase.dart';
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
    getIt.registerLazySingleton<NoteRemoteDataSource>(
      () => const NoteRemoteDataSource(),
    );
  }

  static void _registerRepositories() {
    getIt.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(
        remoteDataSource: getIt(),
      ),
    );
  }

  static void _registerUseCases() {
    getIt.registerFactory<AddNoteUseCase>(
      () => AddNoteUseCase(repository: getIt()),
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
  }

  static void _registerBlocs() {
    getIt.registerFactory<HomeBloc>(
      () => HomeBloc(
        getNotesUseCase: getIt(),
        toggleNoteCompletedStateUseCase: getIt(),
      ),
    );
  }
}
