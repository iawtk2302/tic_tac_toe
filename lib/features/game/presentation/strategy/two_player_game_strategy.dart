import 'package:tic_tac_toe/core/services/audio_service.dart';
import 'package:tic_tac_toe/core/utils/game_util.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
import 'package:tic_tac_toe/features/game/domain/entities/player.dart';
import 'package:tic_tac_toe/features/game/presentation/state/game_state.dart';
import 'package:tic_tac_toe/features/game/presentation/strategy/game_strategy.dart';

class TwoPlayerGameStrategy extends GameStrategy {
  @override
  void initial(GameState state, Function(GameState) onStateChanged) {
    final initialState = state.copyWith(
        board:
            List.generate(3, (_) => List.generate(3, (_) => CellState.empty)),
        currentPlayer: Player.player1,
        result: GameResult.ongoing,
        isYourTurn: true);
    onStateChanged(initialState);
  }

  @override
  Future<void> makeMove(int row, int col, GameState state,
      Function(GameState) onStateChanged) async {
    // Kiểm tra điều kiện nếu không thể đi
    if (state.result != GameResult.ongoing ||
        state.board[row][col] != CellState.empty) {
      return; // Ignore invalid moves
    }

    // Phát âm thanh khi người chơi di chuyển
    if (state.currentPlayer == Player.player1) {
      AudioManager().tapX();
    } else {
      AudioManager().tapO();
    }

    // Cập nhật bàn cờ với nước đi của người chơi
    final updatedBoard = List<List<CellState>>.from(
        state.board.map((row) => List<CellState>.from(row)));
    updatedBoard[row][col] =
        state.currentPlayer == Player.player1 ? CellState.X : CellState.O;

    // Kiểm tra nếu người chơi hiện tại thắng
    GameResult result = GameUtil.checkWinner(updatedBoard);

    if (result == GameResult.win || result == GameResult.lose) {
      // Nếu thắng, cập nhật kết quả và trả lại
      onStateChanged(state.copyWith(
        board: updatedBoard,
        result: GameResult.win,
      ));
      return;
    }

    // Kiểm tra nếu hòa
    if (result == GameResult.draw) {
      onStateChanged(state.copyWith(
        board: updatedBoard,
        result: GameResult.draw,
      ));
      return;
    }

    // Nếu không có người thắng, chuyển lượt sang người chơi khác
    onStateChanged(
      state.copyWith(
        board: updatedBoard,
        currentPlayer: state.currentPlayer == Player.player1
            ? Player.player2
            : Player.player1,
        isYourTurn: state.currentPlayer != Player.player1,
      ),
    );
  }

  @override
  void resetGame(GameState state, Function(GameState) onStateChanged) {
    initial(state, onStateChanged);
  }
}
