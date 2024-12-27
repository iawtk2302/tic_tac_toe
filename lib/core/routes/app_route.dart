import 'package:auto_route/auto_route.dart';
import 'package:tic_tac_toe/core/routes/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  final bool isOnboardingComplete;
  AppRouter({super.navigatorKey, required this.isOnboardingComplete});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true, guards: [
          OnboardingGuard(isOnboardingComplete: isOnboardingComplete)
        ]),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: GameRoute.page),
      ];
}

class OnboardingGuard extends AutoRouteGuard {
  final bool isOnboardingComplete;

  OnboardingGuard({required this.isOnboardingComplete});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isOnboardingComplete) {
      resolver.redirect(const AuthRoute());
    } else {
      resolver.next();
    }
  }
}
