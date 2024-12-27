import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/presentation/notifiers/game_state_notifier.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/board_tile.dart';

class GameBoard extends HookConsumerWidget {
  const GameBoard({super.key, required this.board});
  final List<List<CellState>> board;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        int x = index ~/ 3;
        int y = index % 3;
        return GestureDetector(
          onTap: () {
            ref.read(gameProvider.notifier).makeMove(x, y);
          },
          child: GeneralBoardTile(cellState: board[x][y]),
        );
      },
    );
  }
}
