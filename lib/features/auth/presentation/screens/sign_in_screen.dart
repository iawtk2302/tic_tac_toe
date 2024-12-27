import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/theme/app_text_styles.dart';
import 'package:tic_tac_toe/core/widgets/border_button.dart';
import 'package:tic_tac_toe/features/auth/presentation/providers/provider.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';

@RoutePage()
class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                context.isDarkMode
                    ? Assets.images.png.darkLogo.image(width: 123)
                    : Assets.images.png.logo.image(width: 123),
                const Text("Welcome", style: AppTextStyles.header),
                Text(
                  "Please sign in to continue.",
                  style: AppTextStyles.subtitle2.copyWith(
                    color: context.isDarkMode
                        ? AppColors.lighterGrey
                        : AppColors.grey,
                  ),
                ),
              ],
            ),
            BorderButton(
              width: context.width,
              padding: const EdgeInsets.all(17),
              margin: const EdgeInsets.only(bottom: 40),
              onTap: () {
                ref.read(authProvider.notifier).signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.png.google.image(width: 20),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Sign in with Google"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
