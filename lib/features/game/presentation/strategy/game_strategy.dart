import 'package:tic_tac_toe/features/game/presentation/state/game_state.dart';

abstract class GameStrategy {
  void initial(GameState state, Function(GameState) onStateChanged);
  Future<void> makeMove(
      int row, int col, GameState state, Function(GameState) onStateChanged);
  void resetGame(GameState state, Function(GameState) onStateChanged);
}
