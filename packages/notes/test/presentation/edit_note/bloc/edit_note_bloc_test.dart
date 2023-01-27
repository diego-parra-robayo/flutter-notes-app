import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/domain/usecases/get_note_usecase.dart';
import 'package:notes/domain/usecases/update_note_usecase.dart';
import 'package:notes/presentation/edit_note/bloc/edit_note_bloc.dart';

import '../../../fixtures/fake_notes.dart';

class MockGetNotesUseCase extends Mock implements GetNoteUseCase {}

class MockAddNoteUseCase extends Mock implements AddNoteUseCase {}

class MockUpdateNoteUseCase extends Mock implements UpdateNoteUseCase {}

void main() {
  late GetNoteUseCase getNoteUseCase;
  late AddNoteUseCase addNoteUseCase;
  late UpdateNoteUseCase updateNoteUseCase;
  late EditNoteBloc sut;

  setUp(() {
    getNoteUseCase = MockGetNotesUseCase();
    addNoteUseCase = MockAddNoteUseCase();
    updateNoteUseCase = MockUpdateNoteUseCase();
    sut = EditNoteBloc(
      getNoteUseCase: getNoteUseCase,
      addNoteUseCase: addNoteUseCase,
      updateNoteUseCase: updateNoteUseCase,
    );
  });

  blocTest<EditNoteBloc, EditNoteState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('onStarted', () {
    const note = FakeNotes.fakeNote1;
    final noteId = note.id;

    blocTest<EditNoteBloc, EditNoteState>(
      'when event does not include a noteId, reset noteId in bloc and return',
      build: () => sut,
      act: (bloc) => bloc.add(EditNoteStarted(noteId: null)),
      expect: () => [
        EditNoteState.initial().copyWith(noteId: null),
      ],
    );

    blocTest<EditNoteBloc, EditNoteState>(
      'when event includes noteId, set it in state and load note data',
      setUp: () {
        when(() => getNoteUseCase(noteId: noteId)).thenAnswer(
          (_) async => right(FakeNotes.fakeNote1),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(EditNoteStarted(noteId: noteId)),
      expect: () => [
        EditNoteState.initial().copyWith(noteId: noteId),
        EditNoteState.initial().copyWith(noteId: noteId, isLoading: true),
        EditNoteState.initial().copyWith(
          noteId: noteId,
          title: note.title,
          description: note.description,
        ),
      ],
    );

    blocTest<EditNoteBloc, EditNoteState>(
      'when event includes noteId, but load data is failure, show a popUpMessage',
      setUp: () {
        when(() => getNoteUseCase(noteId: noteId)).thenAnswer(
          (_) async => left(ApiFailure('Couln\'t load data')),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(EditNoteStarted(noteId: noteId)),
      expect: () => [
        EditNoteState.initial().copyWith(noteId: noteId),
        EditNoteState.initial().copyWith(noteId: noteId, isLoading: true),
        EditNoteState.initial().copyWith(
          noteId: noteId,
          popUpMessage: 'Couln\'t load data',
        ),
      ],
    );
  });

  group('onInputChanged', () {
    blocTest<EditNoteBloc, EditNoteState>(
      'when EditNoteTitleChanged is added, update title in state',
      build: () => sut,
      act: (bloc) => bloc.add(EditNoteTitleChanged('new title')),
      expect: () => [
        EditNoteState.initial().copyWith(title: 'new title'),
      ],
    );

    blocTest<EditNoteBloc, EditNoteState>(
      'when EditNoteDescriptionChanged is added, update description in state',
      build: () => sut,
      act: (bloc) => bloc.add(EditNoteDescriptionChanged('new description')),
      expect: () => [
        EditNoteState.initial().copyWith(description: 'new description'),
      ],
    );
  });

  group('onButtonPressed', () {
    final initialState1 = EditNoteState.initial().copyWith(
      noteId: null,
      title: 'new title',
      description: 'new description',
    );
    blocTest<EditNoteBloc, EditNoteState>(
      'when save button is pressed and noteId is null, call addNoteUseCase and update navState to pop',
      setUp: () {
        when(
          () => addNoteUseCase(
            title: initialState1.title,
            description: initialState1.description,
          ),
        ).thenAnswer((_) async => right(unit));
      },
      build: () => sut,
      seed: () => initialState1,
      act: (bloc) => bloc.add(EditNoteSaveButtonPressed()),
      expect: () => [
        initialState1.copyWith(isLoading: true),
        initialState1.copyWith(navState: EditNoteNavState.pop),
      ],
    );

    final initialState2 = EditNoteState.initial().copyWith(
      noteId: '1',
      title: 'updated title',
      description: 'updated description',
    );
    blocTest<EditNoteBloc, EditNoteState>(
      'when save button is pressed and noteId is null, call updateNoteUseCase and update navState to pop',
      setUp: () {
        when(() => updateNoteUseCase(
              noteId: initialState2.noteId!,
              title: initialState2.title,
              description: initialState2.description,
            )).thenAnswer((_) async => right(unit));
      },
      build: () => sut,
      seed: () => initialState2,
      act: (bloc) => bloc.add(EditNoteSaveButtonPressed()),
      expect: () => [
        initialState2.copyWith(isLoading: true),
        initialState2.copyWith(navState: EditNoteNavState.pop),
      ],
    );
  });

  group('onEventHandled', () {
    blocTest<EditNoteBloc, EditNoteState>(
      'when navEvent is handled, update navState to null',
      build: () => sut,
      seed: () => EditNoteState.initial().copyWith(navState: EditNoteNavState.pop),
      act: (bloc) => bloc.add(EditNoteNavEventHandled()),
      expect: () => [
        EditNoteState.initial().copyWith(navState: null),
      ],
    );
    blocTest<EditNoteBloc, EditNoteState>(
    'when popUpMessage is shown, update pop up message to null',
      build: () => sut,
      seed: () => EditNoteState.initial().copyWith(popUpMessage: 'message'),
      act: (bloc) => bloc.add(EditNotePopUpMessageShown()),
      expect: () => [
        EditNoteState.initial().copyWith(popUpMessage: null),
      ],
    );
  });
}
