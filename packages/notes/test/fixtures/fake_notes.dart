import 'package:core/shared_entities/note.dart';

class FakeNotes {
  const FakeNotes._();

  static const fakeNote1 = Note(
    id: '0',
    title: 'Complete Flutter app',
    description: '(No description)',
    isCompleted: false,
  );
  static const fakeNote2 = Note(
    id: '1',
    title: 'Pay credit card',
    description: 'Bank',
    isCompleted: false,
  );
  static const fakeNote3 = Note(
    id: '2',
    title: 'Buy groceries',
    description: 'Milk, eggs, ...',
    isCompleted: false,
  );
  static const fakeNotes = [fakeNote1, fakeNote2, fakeNote3];
}
