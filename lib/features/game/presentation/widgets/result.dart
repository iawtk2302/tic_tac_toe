import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/theme/app_text_styles.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_mode.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_result.dart';
import 'package:tic_tac_toe/features/game/domain/entities/player.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.title,
      required this.desc,
      this.tilteColor,
      this.descColor});
  final String title;
  final String desc;
  final Color? tilteColor;
  final Color? descColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.header.copyWith(color: tilteColor),
        ),
        Text(
          desc,
          style: AppTextStyles.subtitle1.copyWith(color: descColor),
        ),
      ],
    );
  }
}

class ShowResult extends StatelessWidget {
  const ShowResult(
      {super.key,
      required this.result,
      required this.mode,
      required this.player});
  final GameResult result;
  final GameMode mode;
  final Player player;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final descColor = !isDark ? AppColors.darkGrey : AppColors.lightGrey;
    switch (mode) {
      case GameMode.bot:
        return _buildSinglePlayerResult(context, descColor);
      case GameMode.twoPlayer:
        return _buildTwoPlayerResult(context, descColor);
      default:
        return Result(
          title: "",
          desc: "",
          descColor: descColor,
        );
    }
  }

  Widget _buildSinglePlayerResult(BuildContext context, Color descColor) {
    final isDark = context.isDarkMode;
    final descColor = !isDark ? AppColors.darkGrey : AppColors.lightGrey;
    switch (result) {
      case GameResult.win:
        return Result(
          title: "You Won!",
          desc: "Congartulations",
          tilteColor: isDark ? AppColors.darkBlue : AppColors.lightBlue,
          descColor: descColor,
        );
      case GameResult.lose:
        return Result(
          title: "You Lost!",
          desc: "Good luck next time",
          tilteColor: isDark ? AppColors.darkRed : AppColors.lightRed,
          descColor: descColor,
        );
      case GameResult.draw:
        return Result(
          title: "Draw!",
          desc: "It’s a draw",
          descColor: descColor,
        );
      default:
        return Result(
          title: "",
          desc: "",
          descColor: descColor,
        );
    }
  }

  Widget _buildTwoPlayerResult(BuildContext context, Color descColor) {
    final isDark = context.isDarkMode;
    final descColor = !isDark ? AppColors.darkGrey : AppColors.lightGrey;
    switch (result) {
      case GameResult.win:
        return Result(
          title: "${player == Player.player1 ? "Player 1" : "Player 2"} Won!",
          desc: "Congartulations",
          tilteColor: isDark ? AppColors.darkBlue : AppColors.lightBlue,
          descColor: descColor,
        );
      case GameResult.draw:
        return Result(
          title: "Draw!",
          desc: "It’s a draw",
          descColor: descColor,
        );
      default:
        return Result(
          title: "",
          desc: "",
          descColor: descColor,
        );
    }
  }
}
