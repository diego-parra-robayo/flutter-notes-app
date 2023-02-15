// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteDetailsState {
  NoteDetailsStatus get status => throw _privateConstructorUsedError;
  Note? get data => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDetailsStateCopyWith<NoteDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDetailsStateCopyWith<$Res> {
  factory $NoteDetailsStateCopyWith(
          NoteDetailsState value, $Res Function(NoteDetailsState) then) =
      _$NoteDetailsStateCopyWithImpl<$Res, NoteDetailsState>;
  @useResult
  $Res call({NoteDetailsStatus status, Note? data, Failure? failure});

  $NoteCopyWith<$Res>? get data;
}

/// @nodoc
class _$NoteDetailsStateCopyWithImpl<$Res, $Val extends NoteDetailsState>
    implements $NoteDetailsStateCopyWith<$Res> {
  _$NoteDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoteDetailsStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Note?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $NoteCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NoteDetailsStateCopyWith<$Res>
    implements $NoteDetailsStateCopyWith<$Res> {
  factory _$$_NoteDetailsStateCopyWith(
          _$_NoteDetailsState value, $Res Function(_$_NoteDetailsState) then) =
      __$$_NoteDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteDetailsStatus status, Note? data, Failure? failure});

  @override
  $NoteCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_NoteDetailsStateCopyWithImpl<$Res>
    extends _$NoteDetailsStateCopyWithImpl<$Res, _$_NoteDetailsState>
    implements _$$_NoteDetailsStateCopyWith<$Res> {
  __$$_NoteDetailsStateCopyWithImpl(
      _$_NoteDetailsState _value, $Res Function(_$_NoteDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$_NoteDetailsState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NoteDetailsStatus,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Note?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_NoteDetailsState implements _NoteDetailsState {
  _$_NoteDetailsState(
      {required this.status, required this.data, required this.failure});

  @override
  final NoteDetailsStatus status;
  @override
  final Note? data;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'NoteDetailsState(status: $status, data: $data, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, data, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteDetailsStateCopyWith<_$_NoteDetailsState> get copyWith =>
      __$$_NoteDetailsStateCopyWithImpl<_$_NoteDetailsState>(this, _$identity);
}

abstract class _NoteDetailsState implements NoteDetailsState {
  factory _NoteDetailsState(
      {required final NoteDetailsStatus status,
      required final Note? data,
      required final Failure? failure}) = _$_NoteDetailsState;

  @override
  NoteDetailsStatus get status;
  @override
  Note? get data;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$_NoteDetailsStateCopyWith<_$_NoteDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
