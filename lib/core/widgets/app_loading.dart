import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: context.isDarkMode ? AppColors.darkBlue : AppColors.lightBlue,
        ),
      ),
    );
  }
}
