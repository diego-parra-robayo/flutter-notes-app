// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesState {
  NotesStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  Map<String, Note> get notesById => throw _privateConstructorUsedError;
  List<String> get noteIdList => throw _privateConstructorUsedError;
  String? get noteIdDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesStateCopyWith<NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res, NotesState>;
  @useResult
  $Res call(
      {NotesStatus status,
      Failure? failure,
      Map<String, Note> notesById,
      List<String> noteIdList,
      String? noteIdDetails});
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? notesById = null,
    Object? noteIdList = null,
    Object? noteIdDetails = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotesStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      notesById: null == notesById
          ? _value.notesById
          : notesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Note>,
      noteIdList: null == noteIdList
          ? _value.noteIdList
          : noteIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      noteIdDetails: freezed == noteIdDetails
          ? _value.noteIdDetails
          : noteIdDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotesStateCopyWith<$Res>
    implements $NotesStateCopyWith<$Res> {
  factory _$$_NotesStateCopyWith(
          _$_NotesState value, $Res Function(_$_NotesState) then) =
      __$$_NotesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotesStatus status,
      Failure? failure,
      Map<String, Note> notesById,
      List<String> noteIdList,
      String? noteIdDetails});
}

/// @nodoc
class __$$_NotesStateCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$_NotesState>
    implements _$$_NotesStateCopyWith<$Res> {
  __$$_NotesStateCopyWithImpl(
      _$_NotesState _value, $Res Function(_$_NotesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? notesById = null,
    Object? noteIdList = null,
    Object? noteIdDetails = freezed,
  }) {
    return _then(_$_NotesState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotesStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      notesById: null == notesById
          ? _value._notesById
          : notesById // ignore: cast_nullable_to_non_nullable
              as Map<String, Note>,
      noteIdList: null == noteIdList
          ? _value._noteIdList
          : noteIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      noteIdDetails: freezed == noteIdDetails
          ? _value.noteIdDetails
          : noteIdDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NotesState implements _NotesState {
  _$_NotesState(
      {required this.status,
      required this.failure,
      required final Map<String, Note> notesById,
      required final List<String> noteIdList,
      required this.noteIdDetails})
      : _notesById = notesById,
        _noteIdList = noteIdList;

  @override
  final NotesStatus status;
  @override
  final Failure? failure;
  final Map<String, Note> _notesById;
  @override
  Map<String, Note> get notesById {
    if (_notesById is EqualUnmodifiableMapView) return _notesById;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notesById);
  }

  final List<String> _noteIdList;
  @override
  List<String> get noteIdList {
    if (_noteIdList is EqualUnmodifiableListView) return _noteIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteIdList);
  }

  @override
  final String? noteIdDetails;

  @override
  String toString() {
    return 'NotesState(status: $status, failure: $failure, notesById: $notesById, noteIdList: $noteIdList, noteIdDetails: $noteIdDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality()
                .equals(other._notesById, _notesById) &&
            const DeepCollectionEquality()
                .equals(other._noteIdList, _noteIdList) &&
            (identical(other.noteIdDetails, noteIdDetails) ||
                other.noteIdDetails == noteIdDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      failure,
      const DeepCollectionEquality().hash(_notesById),
      const DeepCollectionEquality().hash(_noteIdList),
      noteIdDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      __$$_NotesStateCopyWithImpl<_$_NotesState>(this, _$identity);
}

abstract class _NotesState implements NotesState {
  factory _NotesState(
      {required final NotesStatus status,
      required final Failure? failure,
      required final Map<String, Note> notesById,
      required final List<String> noteIdList,
      required final String? noteIdDetails}) = _$_NotesState;

  @override
  NotesStatus get status;
  @override
  Failure? get failure;
  @override
  Map<String, Note> get notesById;
  @override
  List<String> get noteIdList;
  @override
  String? get noteIdDetails;
  @override
  @JsonKey(ignore: true)
  _$$_NotesStateCopyWith<_$_NotesState> get copyWith =>
      throw _privateConstructorUsedError;
}
