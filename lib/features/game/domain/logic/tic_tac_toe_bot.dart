import 'dart:math';

import 'package:tic_tac_toe/core/utils/game_util.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';

class TicTacToeBot {
  List<List<CellState>> board =
      List.generate(3, (_) => List.generate(3, (_) => CellState.empty));

  // Đánh giá trạng thái bàn cờ
  int _evaluateBoard(List<List<CellState>> board) {
    final result = GameUtil.checkWinner(board);
    if (result == GameResult.lose) return 10;
    if (result == GameResult.win) return -10;
    return 0;
  }

  // Hàm Minimax với giới hạn độ sâu
  int _minimax(
      List<List<CellState>> board, bool isMaximizing, int depth, int maxDepth) {
    final result = GameUtil.checkWinner(board);
    if (result != GameResult.ongoing || depth >= maxDepth) {
      return _evaluateBoard(board);
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == CellState.empty) {
            board[i][j] = CellState.O;
            int score = _minimax(board, false, depth + 1, maxDepth);
            board[i][j] = CellState.empty;
            bestScore = max(score, bestScore);
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == CellState.empty) {
            board[i][j] = CellState.X;
            int score = _minimax(board, true, depth + 1, maxDepth);
            board[i][j] = CellState.empty;
            bestScore = min(score, bestScore);
          }
        }
      }
      return bestScore;
    }
  }

  // Tìm nước đi tốt nhất
  List<int>? _getBestMove() {
    int bestScore = -1000;
    List<List<int>> bestMoves = [];
    const int maxDepth = 3; // Giới hạn độ sâu

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == CellState.empty) {
          board[i][j] = CellState.O;
          int score = _minimax(board, false, 0, maxDepth);
          board[i][j] = CellState.empty;
          if (score > bestScore) {
            bestScore = score;
            bestMoves = [
              [i, j]
            ];
          } else if (score == bestScore) {
            bestMoves.add([i, j]);
          }
        }
      }
    }

    // Chọn ngẫu nhiên từ các nước đi tốt nhất
    if (bestMoves.isNotEmpty) {
      return bestMoves[Random().nextInt(bestMoves.length)];
    }
    return null;
  }

  // Hàm bot di chuyển
  void botMove() {
    // 20% cơ hội bot chơi ngẫu nhiên
    bool shouldPlayRandom = Random().nextDouble() < 0.2;
    if (shouldPlayRandom) {
      List<int>? randomMove = _getRandomMove();
      if (randomMove != null) {
        board[randomMove[0]][randomMove[1]] = CellState.O;
        return;
      }
    }

    // Nếu không, chọn nước đi tốt nhất
    List<int>? bestMove = _getBestMove();
    if (bestMove != null) {
      board[bestMove[0]][bestMove[1]] = CellState.O;
    }
  }

  // Chọn nước đi ngẫu nhiên
  List<int>? _getRandomMove() {
    List<List<int>> emptyCells = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == CellState.empty) {
          emptyCells.add([i, j]);
        }
      }
    }
    if (emptyCells.isNotEmpty) {
      return emptyCells[Random().nextInt(emptyCells.length)];
    }
    return null;
  }
}
