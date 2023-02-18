import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/middlewares/middlewares.dart';
import 'package:redux_core/redux_core.dart';
import 'package:ui/widgets_base/resource_connector.dart';

class EditNoteConnector extends StatelessWidget {
  final String? noteId;
  final Widget Function(BuildContext context, EditNoteViewModel vm) builder;

  const EditNoteConnector({
    Key? key,
    required this.noteId,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourceConnector<AppState, EditNoteViewModel>(
      onInit: (store) => store.dispatch(GetNoteDetailsRequest(id: noteId)),
      loadingSelector: selectNoteDetailsIsLoading,
      popUpMessageSelector: selectNoteDetailsFailure,
      dataConverter: (store) => EditNoteViewModel.fromStore(
        store,
        noteId: noteId,
      ),
      dataBuilder: builder,
      additionalListeners: [
        ListenerPair(
          selector: selectNoteDetailsStatus,
          listener: (context, status) {
            if (status == NoteDetailsStatus.saveSuccess) context.pop();
          },
        ),
      ],
    );
  }
}

class EditNoteViewModel extends Equatable {
  final NoteFormData? initialFormData;
  final void Function(NoteFormData data) onSaveCallback;

  const EditNoteViewModel({
    required this.initialFormData,
    required this.onSaveCallback,
  });

  factory EditNoteViewModel.fromStore(
    Store<AppState> store, {
    required String? noteId,
  }) {
    final note = selectNoteDetails(store.state);
    return EditNoteViewModel(
      initialFormData: note == null
          ? null
          : NoteFormData(
              title: note.title,
              description: note.description,
            ),
      onSaveCallback: (formData) {
        final request = noteId == null
            ? AddNoteRequest(
                title: formData.title,
                description: formData.description,
              )
            : UpdateNoteRequest(
                id: noteId,
                title: formData.title,
                description: formData.description,
              );
        store.dispatch(request);
      },
    );
  }

  @override
  List<Object?> get props => [initialFormData];
}

class NoteFormData extends Equatable {
  final String title;
  final String description;

  const NoteFormData({
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [title, description];
}
