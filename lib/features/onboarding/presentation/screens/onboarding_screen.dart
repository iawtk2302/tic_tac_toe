import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tic_tac_toe/core/extensions/theme_extensions.dart';
import 'package:tic_tac_toe/core/routes/app_route.gr.dart';
import 'package:tic_tac_toe/core/theme/app_colors.dart';
import 'package:tic_tac_toe/core/theme/app_text_styles.dart';
import 'package:tic_tac_toe/gen/assets.gen.dart';

@RoutePage()
class OnboardingScreen extends HookWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final pageViewController = usePageController();
    final tabController = useTabController(initialLength: 3);
    final currentPageIndex = useState<int>(0);
    final listImageWidgets = useMemoized(() => [
          Assets.images.png.idea.image(),
          Assets.images.png.swords1.image(),
          Assets.images.png.winner1.image()
        ]);
    final listTitles = useMemoized(() => ["Welcome", "Compete", "Scoreboard"]);
    final listDecs = useMemoized(() => [
          "Most fun game now available on your smartphone device!",
          "Play online with your friends and top the leaderboard!",
          "Earn points for each game and make your way to top the scoreboard!"
        ]);

    void handlePageViewChanged(int value) {
      tabController.index = value;
      currentPageIndex.value = value;
    }

    void updateCurrentPageIndex(int index) {
      tabController.index = index;
      currentPageIndex.value = index;
      pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              itemCount: 3,
              controller: pageViewController,
              onPageChanged: handlePageViewChanged,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listImageWidgets[index],
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      listTitles[index],
                      style: AppTextStyles.header.copyWith(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        listDecs[index],
                        style: AppTextStyles.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PageIndicator(
              tabController: tabController,
              currentPageIndex: currentPageIndex.value,
              onUpdateCurrentPageIndex: updateCurrentPageIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            if (currentPageIndex != 0)
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (currentPageIndex == 0) return;
                  onUpdateCurrentPageIndex(currentPageIndex - 1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Back',
                    style: AppTextStyles.body1.copyWith(
                        color: context.isDarkMode
                            ? AppColors.lighterGrey
                            : AppColors.grey),
                  ),
                ),
              ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (currentPageIndex == 2) {
                  context.router.replace(const AuthRoute());
                  return;
                }
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              },
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Next',
                  style: AppTextStyles.body1,
                ),
              ),
            ),
          ],
        ),
        TabPageSelector(
          controller: tabController,
          color: context.isDarkMode ? AppColors.lightGrey : AppColors.grey,
          selectedColor:
              context.isDarkMode ? AppColors.darkBlue : AppColors.lightBlue,
          borderStyle: BorderStyle.none,
        ),
      ],
    );
  }
}
