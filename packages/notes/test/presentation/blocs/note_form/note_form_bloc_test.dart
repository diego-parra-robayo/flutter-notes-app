import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes/domain/usecases/add_note_usecase.dart';
import 'package:notes/domain/usecases/get_note_usecase.dart';
import 'package:notes/domain/usecases/update_note_usecase.dart';
import 'package:notes/presentation/blocs/note_form/note_form_bloc.dart';

import '../../../fixtures/fake_notes.dart';

class MockGetNotesUseCase extends Mock implements GetNoteUseCase {}

class MockAddNoteUseCase extends Mock implements AddNoteUseCase {}

class MockUpdateNoteUseCase extends Mock implements UpdateNoteUseCase {}

void main() {
  late GetNoteUseCase getNoteUseCase;
  late AddNoteUseCase addNoteUseCase;
  late UpdateNoteUseCase updateNoteUseCase;
  late NoteFormBloc sut;

  setUp(() {
    getNoteUseCase = MockGetNotesUseCase();
    addNoteUseCase = MockAddNoteUseCase();
    updateNoteUseCase = MockUpdateNoteUseCase();
    sut = NoteFormBloc(
      getNoteUseCase: getNoteUseCase,
      addNoteUseCase: addNoteUseCase,
      updateNoteUseCase: updateNoteUseCase,
    );
  });

  blocTest<NoteFormBloc, NoteFormState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('onStarted', () {
    const note = FakeNotes.fakeNote1;
    final noteId = note.id;

    blocTest<NoteFormBloc, NoteFormState>(
      'when event does not include a noteId, reset noteId in bloc and return',
      build: () => sut,
      act: (bloc) => bloc.add(NoteFormStarted(noteId: null)),
      expect: () => [
        NoteFormState.initial().copyWith(noteId: null),
      ],
    );

    blocTest<NoteFormBloc, NoteFormState>(
      'when event includes noteId, set it in state and load note data',
      setUp: () {
        when(() => getNoteUseCase(noteId: noteId)).thenAnswer(
          (_) async => right(FakeNotes.fakeNote1),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(NoteFormStarted(noteId: noteId)),
      expect: () => [
        NoteFormState.initial().copyWith(noteId: noteId),
        NoteFormState.initial().copyWith(noteId: noteId, isLoading: true),
        NoteFormState.initial().copyWith(
          noteId: noteId,
          title: note.title,
          description: note.description,
        ),
      ],
    );

    blocTest<NoteFormBloc, NoteFormState>(
      'when event includes noteId, but load data is failure, show a popUpMessage',
      setUp: () {
        when(() => getNoteUseCase(noteId: noteId)).thenAnswer(
          (_) async => left(const ApiFailure('Couldn\'t load data')),
        );
      },
      build: () => sut,
      act: (bloc) => bloc.add(NoteFormStarted(noteId: noteId)),
      expect: () => [
        NoteFormState.initial().copyWith(noteId: noteId),
        NoteFormState.initial().copyWith(noteId: noteId, isLoading: true),
        NoteFormState.initial().copyWith(
          noteId: noteId,
          popUpMessage: 'Couldn\'t load data',
        ),
      ],
    );
  });

  group('onInputChanged', () {
    blocTest<NoteFormBloc, NoteFormState>(
      'when NoteFormTitleChanged is added, update title in state',
      build: () => sut,
      act: (bloc) => bloc.add(NoteFormTitleChanged('new title')),
      expect: () => [
        NoteFormState.initial().copyWith(title: 'new title'),
      ],
    );

    blocTest<NoteFormBloc, NoteFormState>(
      'when NoteFormDescriptionChanged is added, update description in state',
      build: () => sut,
      act: (bloc) => bloc.add(NoteFormDescriptionChanged('new description')),
      expect: () => [
        NoteFormState.initial().copyWith(description: 'new description'),
      ],
    );
  });

  group('onButtonPressed', () {
    final initialState1 = NoteFormState.initial().copyWith(
      noteId: null,
      title: 'new title',
      description: 'new description',
    );
    blocTest<NoteFormBloc, NoteFormState>(
      'when save button is pressed and noteId is null, call addNoteUseCase and update state result to success',
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
      act: (bloc) => bloc.add(NoteFormSaveButtonPressed()),
      expect: () => [
        initialState1.copyWith(isLoading: true),
        initialState1.copyWith(result: NoteFormResultSuccess()),
      ],
    );

    final initialState2 = NoteFormState.initial().copyWith(
      noteId: '1',
      title: 'updated title',
      description: 'updated description',
    );
    blocTest<NoteFormBloc, NoteFormState>(
      'when save button is pressed and noteId is not null, call updateNoteUseCase and update state result to success',
      setUp: () {
        when(() => updateNoteUseCase(
              noteId: initialState2.noteId!,
              title: initialState2.title,
              description: initialState2.description,
            )).thenAnswer((_) async => right(unit));
      },
      build: () => sut,
      seed: () => initialState2,
      act: (bloc) => bloc.add(NoteFormSaveButtonPressed()),
      expect: () => [
        initialState2.copyWith(isLoading: true),
        initialState2.copyWith(result: NoteFormResultSuccess()),
      ],
    );
  });

  group('onEventHandled', () {
    blocTest<NoteFormBloc, NoteFormState>(
      'when result is handled, update result to null',
      build: () => sut,
      seed: () =>
          NoteFormState.initial().copyWith(result: NoteFormResultSuccess()),
      act: (bloc) => bloc.add(NoteFormResultHandled()),
      expect: () => [
        NoteFormState.initial().copyWith(result: null),
      ],
    );
    blocTest<NoteFormBloc, NoteFormState>(
      'when popUpMessage is shown, update pop up message to null',
      build: () => sut,
      seed: () => NoteFormState.initial().copyWith(popUpMessage: 'message'),
      act: (bloc) => bloc.add(NoteFormPopUpMessageShown()),
      expect: () => [
        NoteFormState.initial().copyWith(popUpMessage: null),
      ],
    );
  });
}
