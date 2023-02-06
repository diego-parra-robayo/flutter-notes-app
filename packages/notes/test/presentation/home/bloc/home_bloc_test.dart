import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failure.dart';
import 'package:core/entities/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/usecases/delete_note_usecase.dart';
import 'package:notes/domain/usecases/get_notes_usecase.dart';
import 'package:notes/domain/usecases/toggle_note_completed_state_usecase.dart';
import 'package:notes/presentation/home/bloc/home_bloc.dart';

import '../../../fixtures/fake_notes.dart';

class MockGetNotesUseCase extends Mock implements GetNotesUseCase {}

class MockToggleNoteCompletedStateUseCase extends Mock
    implements ToggleNoteCompletedStateUseCase {}

class MockDeleteNoteUseCase extends Mock implements DeleteNoteUseCase {}

void main() {
  late GetNotesUseCase getNotesUseCase;
  late ToggleNoteCompletedStateUseCase toggleNoteCompletedStateUseCase;
  late DeleteNoteUseCase deleteNoteUseCase;
  late HomeBloc sut;
  const fakeNotes = FakeNotes.fakeNotes;

  setUp(() {
    getNotesUseCase = MockGetNotesUseCase();
    toggleNoteCompletedStateUseCase = MockToggleNoteCompletedStateUseCase();
    deleteNoteUseCase = MockDeleteNoteUseCase();

    sut = HomeBloc(
      getNotesUseCase: getNotesUseCase,
      toggleNoteCompletedStateUseCase: toggleNoteCompletedStateUseCase,
      deleteNoteUseCase: deleteNoteUseCase,
    );
  });

  blocTest<HomeBloc, HomeState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('onStarted', () {
    blocTest<HomeBloc, HomeState>(
      'verify notes are loaded',
      setUp: () {
        when(() => getNotesUseCase()).thenAnswer((_) async => right(fakeNotes));
      },
      build: () => sut,
      act: (bloc) => bloc.add(HomeStarted()),
      expect: () => [
        HomeState.initial().copyWith(isLoading: true),
        HomeState.initial().copyWith(notes: fakeNotes),
      ],
    );
    blocTest(
      'when getNotesUseCase throws an error',
      setUp: () {
        when(() => getNotesUseCase()).thenAnswer(
          (_) async => left(ApiFailure('Couldn\'t load notes')),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(HomeStarted()),
      expect: () => [
        HomeState.initial().copyWith(isLoading: true),
        HomeState.initial().copyWith(errorMessage: 'Couldn\'t load notes'),
      ],
    );
  });

  group('onButtonPressed', () {
    final initialState = HomeState.initial().copyWith(notes: fakeNotes);
    group('HomeAddNotePressed', () {
      blocTest<HomeBloc, HomeState>(
        'when add note is pressed, update navState to addNote',
        build: () => sut,
        seed: () => initialState,
        act: (bloc) => bloc.add(HomeAddNotePressed()),
        expect: () => [
          initialState.copyWith(navState: HomeNavToAddNote()),
        ],
      );
    });
    group('HomeNotePressed', () {
      final noteId = initialState.notes.first.id;
      blocTest<HomeBloc, HomeState>(
        'when note is pressed, update navState to edit with arg',
        build: () => sut,
        seed: () => initialState,
        act: (bloc) => bloc.add(HomeNotePressed(noteId)),
        expect: () => [
          initialState.copyWith(navState: HomeNavToEditNote(noteId: noteId)),
        ],
      );
    });
    group('HomeToggleCompletedPressed', () {
      const note = Note(
        id: 'toggleNote',
        title: 'Title',
        description: 'Description',
        isCompleted: true,
      );
      final initialNotes = [...fakeNotes, note];
      final initialState = HomeState.initial().copyWith(notes: initialNotes);

      final toggledNote = note.copyWith(isCompleted: false);
      final endNotes = [...fakeNotes, toggledNote];

      blocTest<HomeBloc, HomeState>(
        'when toggle event is added, update note with opposite completed state',
        setUp: () {
          when(() => toggleNoteCompletedStateUseCase(
                noteId: note.id,
                newState: toggledNote.isCompleted,
              )).thenAnswer((_) async => right(unit));
        },
        build: () => sut,
        seed: () => initialState,
        act: (bloc) => bloc.add(HomeToggleCompletedPressed(noteId: note.id)),
        expect: () => [
          initialState.copyWith(isLoading: true),
          initialState.copyWith(notes: endNotes),
        ],
      );
    });
    group('HomeDeleteNotePressed', () {
      const noteToDelete = FakeNotes.fakeNote2;
      final initialNotes = [
        FakeNotes.fakeNote1,
        FakeNotes.fakeNote2,
        FakeNotes.fakeNote3
      ];
      final initialState = HomeState.initial().copyWith(notes: initialNotes);
      final endNotes = [FakeNotes.fakeNote1, FakeNotes.fakeNote3];
      blocTest<HomeBloc, HomeState>(
        'when delete event is added, update notes list without deleted note',
        setUp: () {
          when(() => deleteNoteUseCase(noteId: noteToDelete.id))
              .thenAnswer((_) async => right(unit));
        },
        build: () => sut,
        seed: () => initialState,
        act: (bloc) => bloc.add(HomeDeleteNotePressed(noteToDelete.id)),
        expect: () => [
          initialState.copyWith(isLoading: true),
          initialState.copyWith(notes: endNotes, popUpMessage: 'Note deleted'),
        ],
      );
    });
  });

  group('onEventHandled', () {
    blocTest<HomeBloc, HomeState>(
      'when nav event is handled, update navState to null',
      build: () => sut,
      seed: () => HomeState.initial().copyWith(navState: HomeNavToAddNote()),
      act: (bloc) => bloc.add(HomeNavEventHandled()),
      expect: () => [
        HomeState.initial().copyWith(navState: null),
      ],
    );
    blocTest<HomeBloc, HomeState>(
      'when pop up message is shown, update popUpMessage to null',
      build: () => sut,
      seed: () => HomeState.initial().copyWith(popUpMessage: 'message'),
      act: (bloc) => bloc.add(HomePopUpMessageShown()),
      expect: () => [
        HomeState.initial().copyWith(popUpMessage: null),
      ],
    );
  });
}
