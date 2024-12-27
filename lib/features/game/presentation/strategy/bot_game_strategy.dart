import 'package:tic_tac_toe/core/services/audio_service.dart';
import 'package:tic_tac_toe/core/utils/game_util.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
import 'package:tic_tac_toe/features/game/domain/entities/player.dart';
import 'package:tic_tac_toe/features/game/domain/logic/tic_tac_toe_bot.dart';
import 'package:tic_tac_toe/features/game/presentation/state/game_state.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/game_strategy.dart';

class BotGameStrategy extends GameStrategy {
  bool isBotThinking = false;
  final TicTacToeBot _bot = TicTacToeBot();

  @override
  void initial(GameState state, Function(GameState) onStateChanged) {
    final initialState = state.copyWith(
      board: List.generate(3, (_) => List.generate(3, (_) => CellState.empty)),
      currentPlayer: Player.human,
      result: GameResult.ongoing,
      isYourTurn: true,
    );
    onStateChanged(initialState);
  }

  @override
  Future<void> makeMove(int row, int col, GameState state,
      Function(GameState) onStateChanged) async {
    if (state.result != GameResult.ongoing ||
        state.board[row][col] != CellState.empty ||
        isBotThinking) {
      return; // Ignore invalid moves
    }

    AudioManager().tapX();

    // Update the board with the player's move
    final updatedBoard = List<List<CellState>>.from(state.board);
    updatedBoard[row][col] = CellState.X;

    // Check if the player has won
    final playerWin = GameUtil.checkWinner(updatedBoard) == GameResult.win;
    if (playerWin) {
      onStateChanged(state.copyWith(
        board: updatedBoard,
        result: GameResult.win,
      ));
      return;
    }

    // If game is still ongoing, let the bot make a move
    isBotThinking = true;
    onStateChanged(state.copyWith(
      board: updatedBoard,
      currentPlayer: Player.bot,
      isYourTurn: false,
    ));

    // Let the bot make its move after a delay
    await Future.delayed(const Duration(milliseconds: 600));
    _botMove(updatedBoard, state, onStateChanged);
  }

  void _botMove(List<List<CellState>> updatedBoard, GameState state,
      Function(GameState) onStateChanged) {
    _bot.board = updatedBoard;
    _bot.botMove();

    // Get the new board after the bot's move
    final botBoard = List<List<CellState>>.from(_bot.board);

    final botWin = GameUtil.checkWinner(botBoard) == GameResult.lose;
    final isDraw = GameUtil.checkWinner(botBoard) == GameResult.draw;

    if (!botWin && !isDraw) {
      AudioManager().tapO();
    }

    // Call onStateChanged only once after all changes
    onStateChanged(state.copyWith(
        board: botBoard,
        result: botWin
            ? GameResult.lose
            : isDraw
                ? GameResult.draw
                : GameResult.ongoing,
        currentPlayer: botWin || isDraw ? state.currentPlayer : Player.human,
        isYourTurn: true));

    isBotThinking = false;
  }

  @override
  void resetGame(GameState state, Function(GameState) onStateChanged) {
    initial(state, onStateChanged);
  }
}
