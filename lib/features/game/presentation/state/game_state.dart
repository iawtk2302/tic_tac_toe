// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/player.dart';

// part 'bot_game_state.freezed.dart';

// @freezed
// class BotGameState with _$BotGameState {
//   const factory BotGameState({
//     required List<List<CellState>> board,
//     required Player currentPlayer,
//     required GameResult result,
//     required bool isBotThinking,
//   }) = _BotGameState;
//   factory BotGameState.initial() => BotGameState(
//         board:
//             List.generate(3, (_) => List.generate(3, (_) => CellState.empty)),
//         currentPlayer: Player.human,
//         result: GameResult.ongoing,
//         isBotThinking: false,
//       );
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_mode.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
import 'package:tic_tac_toe/features/game/domain/entities/player.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/bot_game_strategy.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/game_strategy.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required GameMode mode,
    required GameStrategy strategy,
    required List<List<CellState>> board,
    required Player currentPlayer,
    required GameResult result,
    required bool isYourTurn,
  }) = _GameState;

  factory GameState.initial() => GameState(
        mode: GameMode.bot,
        strategy: BotGameStrategy(),
        board:
            List.generate(3, (_) => List.generate(3, (_) => CellState.empty)),
        currentPlayer: Player.human,
        result: GameResult.ongoing,
        isYourTurn: true,
      );
}
