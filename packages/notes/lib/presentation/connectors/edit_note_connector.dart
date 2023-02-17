import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/domain/middlewares/middlewares.dart';
import 'package:redux_core/redux_core.dart';
import 'package:ui/widgets_base/resource_connector.dart';

class EditNoteFormConnector extends StatelessWidget {
  final String? noteId;
  final Widget Function(BuildContext context, NoteFormData? initialFormData)
      builder;

  const EditNoteFormConnector({
    Key? key,
    required this.noteId,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResourceConnector<AppState, NoteFormData?>(
      onInit: (store) => store.dispatch(GetNoteDetailsThunk(id: noteId)),
      loadingSelector: selectNoteDetailsIsLoading,
      popUpMessageSelector: selectNoteDetailsPopUpMessage,
      dataConverter: (store) {
        final note = selectNoteDetails(store.state);
        if (note == null) return null;
        return NoteFormData(title: note.title, description: note.description);
      },
      dataBuilder: builder,
    );
  }
}

class EditNoteSaveFormConnector extends StatelessWidget {
  final String? noteId;
  final Widget Function(BuildContext context, OnSaveCallback callback) builder;

  const EditNoteSaveFormConnector({
    Key? key,
    required this.noteId,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreListener<AppState, NoteDetailsStatus>(
      converter: (store) => selectNoteDetailsStatus(store.state),
      listener: (context, status) {
        if (status == NoteDetailsStatus.saveSuccess) context.pop();
      },
      child: StoreConnector<AppState, OnSaveCallback>(
        rebuildOnChange: false,
        converter: (store) => (formData) {
          final request = noteId == null
              ? AddNoteThunk(
                  title: formData.title,
                  description: formData.description,
                )
              : UpdateNoteThunk(
                  id: noteId!,
                  title: formData.title,
                  description: formData.description,
                );
          store.dispatch(request);
        },
        builder: builder,
      ),
    );
  }
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

typedef OnSaveCallback = void Function(NoteFormData data);
