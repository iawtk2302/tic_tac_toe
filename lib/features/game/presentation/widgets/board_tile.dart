import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';

class BoardTile extends StatelessWidget {
  const BoardTile({
    super.key,
    required this.child,
    required this.color,
  });
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: color,
        ),
        borderRadius: BorderRadius.circular(8),
        color: color.withValues(alpha: 0.2),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

class GeneralBoardTile extends StatelessWidget {
  const GeneralBoardTile({super.key, required this.cellState});
  final CellState cellState;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    Color color;
    Widget child;
    switch (cellState) {
      case CellState.X:
        color = isDark ? AppColors.darkRed : AppColors.lightRed;
        child = Icon(
          Icons.close,
          color: color,
          size: 45,
        );
        break;
      case CellState.O:
        color = isDark ? AppColors.darkBlue : AppColors.lightBlue;
        child = Icon(
          Icons.circle_outlined,
          color: color,
          size: 45,
        );
        break;
      default:
        color = isDark ? AppColors.darkGrey : AppColors.lightGrey;
        child = const SizedBox.shrink();
    }
    return BoardTile(
      color: color,
      child: child,
    );
  }
}
