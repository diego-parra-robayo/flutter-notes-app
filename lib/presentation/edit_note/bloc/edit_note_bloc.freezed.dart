// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditNoteState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get popUpMessage => throw _privateConstructorUsedError;
  String? get noteId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  EditNoteNavState? get navState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditNoteStateCopyWith<EditNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditNoteStateCopyWith<$Res> {
  factory $EditNoteStateCopyWith(
          EditNoteState value, $Res Function(EditNoteState) then) =
      _$EditNoteStateCopyWithImpl<$Res, EditNoteState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? popUpMessage,
      String? noteId,
      String title,
      String description,
      EditNoteNavState? navState});
}

/// @nodoc
class _$EditNoteStateCopyWithImpl<$Res, $Val extends EditNoteState>
    implements $EditNoteStateCopyWith<$Res> {
  _$EditNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? popUpMessage = freezed,
    Object? noteId = freezed,
    Object? title = null,
    Object? description = null,
    Object? navState = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      popUpMessage: freezed == popUpMessage
          ? _value.popUpMessage
          : popUpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      noteId: freezed == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      navState: freezed == navState
          ? _value.navState
          : navState // ignore: cast_nullable_to_non_nullable
              as EditNoteNavState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditNoteStateCopyWith<$Res>
    implements $EditNoteStateCopyWith<$Res> {
  factory _$$_EditNoteStateCopyWith(
          _$_EditNoteState value, $Res Function(_$_EditNoteState) then) =
      __$$_EditNoteStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? popUpMessage,
      String? noteId,
      String title,
      String description,
      EditNoteNavState? navState});
}

/// @nodoc
class __$$_EditNoteStateCopyWithImpl<$Res>
    extends _$EditNoteStateCopyWithImpl<$Res, _$_EditNoteState>
    implements _$$_EditNoteStateCopyWith<$Res> {
  __$$_EditNoteStateCopyWithImpl(
      _$_EditNoteState _value, $Res Function(_$_EditNoteState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? popUpMessage = freezed,
    Object? noteId = freezed,
    Object? title = null,
    Object? description = null,
    Object? navState = freezed,
  }) {
    return _then(_$_EditNoteState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      popUpMessage: freezed == popUpMessage
          ? _value.popUpMessage
          : popUpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      noteId: freezed == noteId
          ? _value.noteId
          : noteId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      navState: freezed == navState
          ? _value.navState
          : navState // ignore: cast_nullable_to_non_nullable
              as EditNoteNavState?,
    ));
  }
}

/// @nodoc

class _$_EditNoteState implements _EditNoteState {
  _$_EditNoteState(
      {required this.isLoading,
      required this.popUpMessage,
      required this.noteId,
      required this.title,
      required this.description,
      required this.navState});

  @override
  final bool isLoading;
  @override
  final String? popUpMessage;
  @override
  final String? noteId;
  @override
  final String title;
  @override
  final String description;
  @override
  final EditNoteNavState? navState;

  @override
  String toString() {
    return 'EditNoteState(isLoading: $isLoading, popUpMessage: $popUpMessage, noteId: $noteId, title: $title, description: $description, navState: $navState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditNoteState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.popUpMessage, popUpMessage) ||
                other.popUpMessage == popUpMessage) &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.navState, navState) ||
                other.navState == navState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, popUpMessage, noteId,
      title, description, navState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditNoteStateCopyWith<_$_EditNoteState> get copyWith =>
      __$$_EditNoteStateCopyWithImpl<_$_EditNoteState>(this, _$identity);
}

abstract class _EditNoteState implements EditNoteState {
  factory _EditNoteState(
      {required final bool isLoading,
      required final String? popUpMessage,
      required final String? noteId,
      required final String title,
      required final String description,
      required final EditNoteNavState? navState}) = _$_EditNoteState;

  @override
  bool get isLoading;
  @override
  String? get popUpMessage;
  @override
  String? get noteId;
  @override
  String get title;
  @override
  String get description;
  @override
  EditNoteNavState? get navState;
  @override
  @JsonKey(ignore: true)
  _$$_EditNoteStateCopyWith<_$_EditNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}
