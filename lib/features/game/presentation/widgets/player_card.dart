import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/theme/app_text_styles.dart';
import 'package:tic_tac_toe/features/game/domain/entities/cell_state.dart';
import 'package:tic_tac_toe/features/game/presentation/widgets/general_board_tile_symbol.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.isYourTurn,
    required this.cellState,
    this.name = "",
    required this.ava,
    this.isBot = false,
  });
  final bool isYourTurn;
  final CellState cellState;
  final String name;
  final String ava;
  final bool isBot;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final color = isDark ? AppColors.darkGrey : AppColors.lightGrey;
    return Container(
      width: context.width * 0.34,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: color,
        ),
        borderRadius: BorderRadius.circular(4),
        color: isYourTurn ? color.withValues(alpha: 0.4) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: Column(
        children: [
          ClipOval(
            child: isBot
                ? Assets.images.png.robot.image(
                    height: 50,
                    width: 50,
                  )
                : Image.network(
                    ava,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            isBot ? "Bot" : name,
            style: AppTextStyles.subtitle2.copyWith(fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          GeneralBoardTileSymbol(cellState: cellState)
        ],
      ),
    );
  }
}
