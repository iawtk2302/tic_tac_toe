import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/providers/theme_provider.dart';
import 'package:tic_tac_toe/core/routes/app_route.gr.dart';
import 'package:tic_tac_toe/core/services/audio_service.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/widgets/custom_app_bar.dart';
import 'package:tic_tac_toe/core/widgets/custom_button.dart';
import 'package:tic_tac_toe/features/game/domain/entities/game_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/notifiers/game_state_notifier.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = context.isDarkMode;
    final appRouter = useMemoized(() => context.router);
    return Scaffold(
      appBar: CustomAppBar(
        showBackButton: false,
        actions: [
          Container(
            decoration: BoxDecoration(
                color: isDark ? AppColors.darkerGrey : AppColors.lighterGrey,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(4),
            child: isDark
                ? GestureDetector(
                    onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
                    child: Assets.images.png.sun.image(height: 30),
                  )
                : GestureDetector(
                    onTap: () => ref.read(themeProvider.notifier).toggleTheme(),
                    child: Assets.images.png.moon.image(height: 30),
                  ),
          )
        ],
      ),
      body: SizedBox(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              isDark
                  ? Assets.images.png.darkLogo.image(height: 150)
                  : Assets.images.png.logo.image(height: 150),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "TIC TAC TOE",
                style: TextStyle(fontSize: 48),
              ),
              const SizedBox(
                height: 42,
              ),
              CustomButton(
                onTap: () async {
                  await AudioManager().tap();
                  ref.read(gameProvider.notifier).changeMode(GameMode.bot);
                  appRouter.push(const GameRoute());
                },
                darkColor: AppColors.darkGrey,
                lightColor: AppColors.lightGrey,
                padding: const EdgeInsets.all(6),
                child: const Center(
                  child: Text(
                    "Play Solo",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () async {
                  await AudioManager().tap();
                  ref
                      .read(gameProvider.notifier)
                      .changeMode(GameMode.twoPlayer);
                  appRouter.push(const GameRoute());
                },
                darkColor: AppColors.darkGrey,
                lightColor: AppColors.lightGrey,
                padding: const EdgeInsets.all(6),
                child: const Center(
                  child: Text(
                    "Play with a friend",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                onTap: () {},
                darkColor: AppColors.darkBlue,
                lightColor: AppColors.lightBlue,
                padding: const EdgeInsets.all(6),
                child: const Center(
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
