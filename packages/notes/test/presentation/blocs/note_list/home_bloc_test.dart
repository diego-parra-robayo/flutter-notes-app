import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:locale/generated/app_localizations_en.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/domain/usecases/get_notes_usecase.dart';
import 'package:notes/domain/usecases/toggle_note_completed_state_usecase.dart';
import 'package:notes/presentation/blocs/note_list/notes_bloc.dart';

import '../../../fixtures/fake_notes.dart';

class MockGetNotesUseCase extends Mock implements GetNotesUseCase {}

class MockToggleNoteCompletedStateUseCase extends Mock
    implements ToggleNoteCompletedStateUseCase {}

class MockDeleteNoteUseCase extends Mock implements DeleteNoteUseCase {}

void main() {
  late GetNotesUseCase getNotesUseCase;
  late ToggleNoteCompletedStateUseCase toggleNoteCompletedStateUseCase;
  late DeleteNoteUseCase deleteNoteUseCase;
  late NotesBloc sut;
  const fakeNotes = FakeNotes.fakeNotes;

  setUp(() {
    getNotesUseCase = MockGetNotesUseCase();
    toggleNoteCompletedStateUseCase = MockToggleNoteCompletedStateUseCase();
    deleteNoteUseCase = MockDeleteNoteUseCase();

    sut = NotesBloc(
      getNotesUseCase: getNotesUseCase,
      toggleNoteCompletedStateUseCase: toggleNoteCompletedStateUseCase,
      deleteNoteUseCase: deleteNoteUseCase,
    );
  });

  blocTest<NotesBloc, NotesState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('onStarted', () {
    blocTest<NotesBloc, NotesState>(
      'verify notes are loaded',
      setUp: () {
        when(() => getNotesUseCase()).thenAnswer((_) async => right(fakeNotes));
      },
      build: () => sut,
      act: (bloc) => bloc.add(NotesStarted()),
      expect: () => [
        NotesState.initial().copyWith(isLoading: true),
        NotesState.initial().copyWith(notes: fakeNotes),
      ],
    );
    blocTest(
      'when getNotesUseCase throws an error',
      setUp: () {
        when(() => getNotesUseCase()).thenAnswer(
          (_) async => left(const ApiFailure('Couldn\'t load notes')),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(NotesStarted()),
      expect: () => [
        NotesState.initial().copyWith(isLoading: true),
        NotesState.initial().copyWith(errorMessage: 'Couldn\'t load notes'),
      ],
    );
  });

  group('onButtonPressed', () {
    group('NotesToggleCompletedPressed', () {
      const note = Note(
        id: 'toggleNote',
        title: 'Title',
        description: 'Description',
        isCompleted: true,
      );
      final initialNotes = [...fakeNotes, note];
      final initialState = NotesState.initial().copyWith(notes: initialNotes);

      final toggledNote = note.copyWith(isCompleted: false);
      final endNotes = [...fakeNotes, toggledNote];

      blocTest<NotesBloc, NotesState>(
        'when toggle event is added, update note with opposite completed state',
        setUp: () {
          when(() => toggleNoteCompletedStateUseCase(
                noteId: note.id,
                newState: toggledNote.isCompleted,
              )).thenAnswer((_) async => right(unit));
        },
        build: () => sut,
        seed: () => initialState,
        act: (bloc) =>
            bloc.add(NotesToggleNoteCompletedPressed(noteId: note.id)),
        expect: () => [
          initialState.copyWith(isLoading: true),
          initialState.copyWith(notes: endNotes),
        ],
      );
    });
    group('NotesDeleteNotePressed', () {
      const noteToDelete = FakeNotes.fakeNote2;
      final initialNotes = [
        FakeNotes.fakeNote1,
        FakeNotes.fakeNote2,
        FakeNotes.fakeNote3
      ];
      final initialState = NotesState.initial().copyWith(notes: initialNotes);
      final endNotes = [FakeNotes.fakeNote1, FakeNotes.fakeNote3];
      blocTest<NotesBloc, NotesState>(
        'when delete event is added, update notes list without deleted note',
        setUp: () {
          when(() => deleteNoteUseCase(noteId: noteToDelete.id))
              .thenAnswer((_) async => right(unit));
        },
        build: () => sut,
        seed: () => initialState,
        act: (bloc) => bloc.add(NotesDeleteNotePressed(noteToDelete.id,
            l10n: AppLocalizationsEn())),
        expect: () => [
          initialState.copyWith(isLoading: true),
          initialState.copyWith(notes: endNotes, popUpMessage: 'Note deleted'),
        ],
      );
    });
  });

  group('onEventHandled', () {
    blocTest<NotesBloc, NotesState>(
      'when pop up message is shown, update popUpMessage to null',
      build: () => sut,
      seed: () => NotesState.initial().copyWith(popUpMessage: 'message'),
      act: (bloc) => bloc.add(NotesPopUpMessageShown()),
      expect: () => [
        NotesState.initial().copyWith(popUpMessage: null),
      ],
    );
  });
}
