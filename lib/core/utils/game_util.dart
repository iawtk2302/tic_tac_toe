import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';

class GameUtil {
  // Hàm kiểm tra người thắng
  static GameResult checkWinner(List<List<CellState>> board) {
    for (int i = 0; i < 3; i++) {
      // Kiểm tra hàng ngang
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != CellState.empty) {
        return board[i][0] == CellState.X ? GameResult.win : GameResult.lose;
      }
      // Kiểm tra hàng dọc
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != CellState.empty) {
        return board[0][i] == CellState.X ? GameResult.win : GameResult.lose;
      }
    }
    // Kiểm tra đường chéo
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != CellState.empty) {
      return board[0][0] == CellState.X ? GameResult.win : GameResult.lose;
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != CellState.empty) {
      return board[0][2] == CellState.X ? GameResult.win : GameResult.lose;
    }
    // Kiểm tra hòa
    if (board.every((row) => row.every((cell) => cell != CellState.empty))) {
      return GameResult.draw;
    }
    return GameResult.ongoing;
  }
}
