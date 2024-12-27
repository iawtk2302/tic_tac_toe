import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.child,
      required this.darkColor,
      required this.lightColor,
      this.height,
      this.width,
      this.padding});
  final VoidCallback? onTap;
  final Widget child;
  final Color darkColor;
  final Color lightColor;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height,
        width: width ?? context.width,
        decoration: BoxDecoration(
          color: isDark ? darkColor : lightColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}
