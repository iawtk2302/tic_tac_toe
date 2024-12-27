// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  GameMode get mode => throw _privateConstructorUsedError;
  GameStrategy get strategy => throw _privateConstructorUsedError;
  List<List<CellState>> get board => throw _privateConstructorUsedError;
  Player get currentPlayer => throw _privateConstructorUsedError;
  GameResult get result => throw _privateConstructorUsedError;
  bool get isYourTurn => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {GameMode mode,
      GameStrategy strategy,
      List<List<CellState>> board,
      Player currentPlayer,
      GameResult result,
      bool isYourTurn});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? strategy = null,
    Object? board = null,
    Object? currentPlayer = null,
    Object? result = null,
    Object? isYourTurn = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as GameStrategy,
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<CellState>>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as GameResult,
      isYourTurn: null == isYourTurn
          ? _value.isYourTurn
          : isYourTurn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameMode mode,
      GameStrategy strategy,
      List<List<CellState>> board,
      Player currentPlayer,
      GameResult result,
      bool isYourTurn});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? strategy = null,
    Object? board = null,
    Object? currentPlayer = null,
    Object? result = null,
    Object? isYourTurn = null,
  }) {
    return _then(_$GameStateImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as GameMode,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as GameStrategy,
      board: null == board
          ? _value._board
          : board // ignore: cast_nullable_to_non_nullable
              as List<List<CellState>>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as GameResult,
      isYourTurn: null == isYourTurn
          ? _value.isYourTurn
          : isYourTurn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {required this.mode,
      required this.strategy,
      required final List<List<CellState>> board,
      required this.currentPlayer,
      required this.result,
      required this.isYourTurn})
      : _board = board;

  @override
  final GameMode mode;
  @override
  final GameStrategy strategy;
  final List<List<CellState>> _board;
  @override
  List<List<CellState>> get board {
    if (_board is EqualUnmodifiableListView) return _board;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_board);
  }

  @override
  final Player currentPlayer;
  @override
  final GameResult result;
  @override
  final bool isYourTurn;

  @override
  String toString() {
    return 'GameState(mode: $mode, strategy: $strategy, board: $board, currentPlayer: $currentPlayer, result: $result, isYourTurn: $isYourTurn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            const DeepCollectionEquality().equals(other._board, _board) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.isYourTurn, isYourTurn) ||
                other.isYourTurn == isYourTurn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mode,
      strategy,
      const DeepCollectionEquality().hash(_board),
      currentPlayer,
      result,
      isYourTurn);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {required final GameMode mode,
      required final GameStrategy strategy,
      required final List<List<CellState>> board,
      required final Player currentPlayer,
      required final GameResult result,
      required final bool isYourTurn}) = _$GameStateImpl;

  @override
  GameMode get mode;
  @override
  GameStrategy get strategy;
  @override
  List<List<CellState>> get board;
  @override
  Player get currentPlayer;
  @override
  GameResult get result;
  @override
  bool get isYourTurn;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
