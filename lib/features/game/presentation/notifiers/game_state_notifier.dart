// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tic_tac_toe/core/services/audio_service.dart';
// import 'package:tic_tac_toe/core/utils/game_util.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
// import 'package:tic_tac_toe/features/game/domain/entities/player.dart';
// import 'package:tic_tac_toe/features/game/domain/logic/tic_tac_toe_bot.dart';
// import 'package:tic_tac_toe/features/game/presentation/state/bot_game_state.dart';

// class BotGameStateNotifier extends StateNotifier<BotGameState> {
//   BotGameStateNotifier() : super(BotGameState.initial());

//   final TicTacToeBot _bot = TicTacToeBot();

//   Future<void> makeMove(int row, int col) async {
//     if (state.result != GameResult.ongoing ||
//         state.board[row][col] != CellState.empty ||
//         state.isBotThinking) {
//       return; // Ignore invalid moves
//     }

//     AudioManager().tapX();

//     // Update board with player's move
//     final updatedBoard = List<List<CellState>>.from(
//         state.board.map((row) => List<CellState>.from(row)));
//     updatedBoard[row][col] = CellState.X;

//     // Check if the player has won
//     final playerWin = GameUtil.checkWinner(updatedBoard) == GameResult.win;

//     if (playerWin) {
//       state = state.copyWith(
//         board: updatedBoard,
//         result: GameResult.win,
//       );
//       return;
//     }

//     // If the game is ongoing, let the bot make a move
//     state = state.copyWith(
//       board: updatedBoard,
//       currentPlayer: Player.bot,
//       isBotThinking: true,
//     );
//     // Let the bot move after a delay
//     await Future.delayed(const Duration(milliseconds: 600));
//     _botMove(updatedBoard);
//   }

//   /// Handle the bot's move
//   void _botMove(List<List<CellState>> updatedBoard) {
//     _bot.board = updatedBoard; // Sync board with bot logic
//     _bot.botMove();

//     // update board after bot move
//     final botBoard = List<List<CellState>>.from(_bot.board);

//     final botWin = GameUtil.checkWinner(_bot.board) == GameResult.lose;
//     final isDraw = GameUtil.checkWinner(_bot.board) == GameResult.draw;

//     if (!botWin && !isDraw) {
//       AudioManager().tapO();
//     }

//     state = state.copyWith(
//       board: botBoard,
//       result: botWin
//           ? GameResult.lose
//           : isDraw
//               ? GameResult.draw
//               : GameResult.ongoing,
//       currentPlayer: botWin || isDraw ? state.currentPlayer : Player.human,
//       isBotThinking: false,
//     );
//   }

//   void resetGame() {
//     state = BotGameState.initial();
//   }
// }

// final botGameProvider =
//     StateNotifierProvider<BotGameStateNotifier, BotGameState>((ref) {
//   return BotGameStateNotifier();
// });

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/state/game_state.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/bot_game_strategy.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/game_strategy.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/two_player_game_strategy.dart';

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(GameState.initial());

  void changeMode(GameMode mode) {
    GameStrategy newStrategy;
    switch (mode) {
      case GameMode.bot:
        newStrategy = BotGameStrategy();
        break;
      case GameMode.twoPlayer:
        newStrategy = TwoPlayerGameStrategy();
        break;
      case GameMode.online:
        newStrategy = BotGameStrategy();
        break;
    }
    newStrategy.initial(state, (newState) => state = newState);
    state = state.copyWith(mode: mode, strategy: newStrategy);
  }

  Future<void> makeMove(int row, int col) async {
    await state.strategy
        .makeMove(row, col, state, (newState) => state = newState);
  }

  void resetGame() {
    state.strategy.resetGame(state, (newState) => state = newState);
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GameNotifier();
});
