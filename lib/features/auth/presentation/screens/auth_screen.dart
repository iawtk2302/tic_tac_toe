import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/widgets/app_error.dart';
import 'package:tic_tac_toe/core/widgets/app_loading.dart';
import 'package:tic_tac_toe/features/auth/presentation/providers/provider.dart';
import 'package:tic_tac_toe/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:tic_tac_toe/features/home/presentation/pages/home_screen.dart';

@RoutePage()
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return authState.when(
      loading: () => const AppLoading(),
      authenticated: () => const HomeScreen(),
      unauthenticated: () => const SignInScreen(),
      error: (e) => AppError(error: e),
    );
  }
}
