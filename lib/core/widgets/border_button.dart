import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.onTap,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
  });
  final VoidCallback onTap;
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color:
                context.isDarkMode ? AppColors.darkBlue : AppColors.lightGrey,
          ),
        ),
        child: child,
      ),
    );
  }
}
