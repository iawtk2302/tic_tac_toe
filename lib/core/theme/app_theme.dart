import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme/app_text_styles.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: AppTextStyles.fontFamily,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  fontFamily: AppTextStyles.fontFamily,
);
