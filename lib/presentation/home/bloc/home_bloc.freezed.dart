// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get popUpMessage => throw _privateConstructorUsedError;
  HomeNavState? get navState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Note> notes,
      String? errorMessage,
      String? popUpMessage,
      HomeNavState? navState});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notes = null,
    Object? errorMessage = freezed,
    Object? popUpMessage = freezed,
    Object? navState = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      popUpMessage: freezed == popUpMessage
          ? _value.popUpMessage
          : popUpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      navState: freezed == navState
          ? _value.navState
          : navState // ignore: cast_nullable_to_non_nullable
              as HomeNavState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Note> notes,
      String? errorMessage,
      String? popUpMessage,
      HomeNavState? navState});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notes = null,
    Object? errorMessage = freezed,
    Object? popUpMessage = freezed,
    Object? navState = freezed,
  }) {
    return _then(_$_HomeState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      popUpMessage: freezed == popUpMessage
          ? _value.popUpMessage
          : popUpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      navState: freezed == navState
          ? _value.navState
          : navState // ignore: cast_nullable_to_non_nullable
              as HomeNavState?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState(
      {required this.isLoading,
      required final List<Note> notes,
      required this.errorMessage,
      required this.popUpMessage,
      required this.navState})
      : _notes = notes;

  @override
  final bool isLoading;
  final List<Note> _notes;
  @override
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final String? errorMessage;
  @override
  final String? popUpMessage;
  @override
  final HomeNavState? navState;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, notes: $notes, errorMessage: $errorMessage, popUpMessage: $popUpMessage, navState: $navState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.popUpMessage, popUpMessage) ||
                other.popUpMessage == popUpMessage) &&
            (identical(other.navState, navState) ||
                other.navState == navState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_notes),
      errorMessage,
      popUpMessage,
      navState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {required final bool isLoading,
      required final List<Note> notes,
      required final String? errorMessage,
      required final String? popUpMessage,
      required final HomeNavState? navState}) = _$_HomeState;

  @override
  bool get isLoading;
  @override
  List<Note> get notes;
  @override
  String? get errorMessage;
  @override
  String? get popUpMessage;
  @override
  HomeNavState? get navState;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
