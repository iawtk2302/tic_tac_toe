import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/core/widgets/border_button.dart';
import 'package:tic_tac_toe/core/widgets/custom_app_bar.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
import 'package:tic_tac_toe/features/game/presentation/notifiers/game_state_notifier.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/game_board.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/result.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/row_play_card.dart';

@RoutePage()
class GameScreen extends HookConsumerWidget {
  const GameScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameProvider);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              RowPlayCard(state: state),
              Visibility(
                visible: state.result != GameResult.ongoing,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ShowResult(
                    result: state.result,
                    mode: state.mode,
                    player: state.currentPlayer,
                  ),
                ),
              ),
              GameBoard(board: state.board),
              const Spacer(),
              Visibility(
                visible: state.result != GameResult.ongoing,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: BorderButton(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  onTap: () {
                    ref.read(gameProvider.notifier).resetGame();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt_outlined),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Play Again",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
