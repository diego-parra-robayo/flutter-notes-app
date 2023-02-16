import 'package:redux_core/entities/entities.dart';

import 'action.dart';

class SetNoteDetailsLoadingAction extends Action {}

class SetNoteDetailsFailureAction extends Action {
  final Failure failure;

  SetNoteDetailsFailureAction(this.failure);
}

class SetNoteDetailsAction extends Action {
  final Note? note;
  SetNoteDetailsAction({required this.note});
}