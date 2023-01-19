// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddNoteState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get popUpMessage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  AddNoteNavState? get navState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddNoteStateCopyWith<AddNoteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddNoteStateCopyWith<$Res> {
  factory $AddNoteStateCopyWith(
          AddNoteState value, $Res Function(AddNoteState) then) =
      _$AddNoteStateCopyWithImpl<$Res, AddNoteState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? popUpMessage,
      String title,
      String description,
      AddNoteNavState? navState});
}

/// @nodoc
class _$AddNoteStateCopyWithImpl<$Res, $Val extends AddNoteState>
    implements $AddNoteStateCopyWith<$Res> {
  _$AddNoteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? popUpMessage = freezed,
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
              as AddNoteNavState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddNoteCopyWith<$Res>
    implements $AddNoteStateCopyWith<$Res> {
  factory _$$_AddNoteCopyWith(
          _$_AddNote value, $Res Function(_$_AddNote) then) =
      __$$_AddNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? popUpMessage,
      String title,
      String description,
      AddNoteNavState? navState});
}

/// @nodoc
class __$$_AddNoteCopyWithImpl<$Res>
    extends _$AddNoteStateCopyWithImpl<$Res, _$_AddNote>
    implements _$$_AddNoteCopyWith<$Res> {
  __$$_AddNoteCopyWithImpl(_$_AddNote _value, $Res Function(_$_AddNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? popUpMessage = freezed,
    Object? title = null,
    Object? description = null,
    Object? navState = freezed,
  }) {
    return _then(_$_AddNote(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      popUpMessage: freezed == popUpMessage
          ? _value.popUpMessage
          : popUpMessage // ignore: cast_nullable_to_non_nullable
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
              as AddNoteNavState?,
    ));
  }
}

/// @nodoc

class _$_AddNote implements _AddNote {
  _$_AddNote(
      {required this.isLoading,
      required this.popUpMessage,
      required this.title,
      required this.description,
      required this.navState});

  @override
  final bool isLoading;
  @override
  final String? popUpMessage;
  @override
  final String title;
  @override
  final String description;
  @override
  final AddNoteNavState? navState;

  @override
  String toString() {
    return 'AddNoteState(isLoading: $isLoading, popUpMessage: $popUpMessage, title: $title, description: $description, navState: $navState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddNote &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.popUpMessage, popUpMessage) ||
                other.popUpMessage == popUpMessage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.navState, navState) ||
                other.navState == navState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, popUpMessage, title, description, navState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddNoteCopyWith<_$_AddNote> get copyWith =>
      __$$_AddNoteCopyWithImpl<_$_AddNote>(this, _$identity);
}

abstract class _AddNote implements AddNoteState {
  factory _AddNote(
      {required final bool isLoading,
      required final String? popUpMessage,
      required final String title,
      required final String description,
      required final AddNoteNavState? navState}) = _$_AddNote;

  @override
  bool get isLoading;
  @override
  String? get popUpMessage;
  @override
  String get title;
  @override
  String get description;
  @override
  AddNoteNavState? get navState;
  @override
  @JsonKey(ignore: true)
  _$$_AddNoteCopyWith<_$_AddNote> get copyWith =>
      throw _privateConstructorUsedError;
}
