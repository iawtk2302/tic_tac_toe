import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/di/app_providers.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/domain/entities/player.dart';
import 'package:tic_tac_toe/features/game/presentation/state/game_state.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/player_card.dart';

class RowPlayCard extends ConsumerWidget {
  const RowPlayCard({
    super.key,
    required this.state,
  });
  final GameState state;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PlayerCard(
          isYourTurn: state.isYourTurn,
          cellState: CellState.X,
          name: user.displayName ?? "",
          ava: user.photoURL ?? "",
        ),
        PlayerCard(
          isYourTurn: !state.isYourTurn,
          cellState: CellState.O,
          isBot: state.currentPlayer == Player.bot,
          name: "Player 2",
          ava: user.photoURL ?? "",
        ),
      ],
    );
  }
}
