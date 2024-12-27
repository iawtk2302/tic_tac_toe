import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';

class GeneralBoardTileSymbol extends StatelessWidget {
  const GeneralBoardTileSymbol({super.key, required this.cellState});
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
    return child;
  }
}
