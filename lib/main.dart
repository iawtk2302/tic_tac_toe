import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/core/providers/theme_provider.dart';
import 'package:tic_tac_toe/core/theme/app_theme.dart';
import 'package:tic_tac_toe/di/app_providers.dart';
import 'package:tic_tac_toe/firebase_options.dart';

import 'core/routes/app_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  final isOnboardingComplete =
      sharedPreferences.getBool(ONBOARDING_COMPLETE) ?? false;
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(isOnboardingComplete),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp(this.isOnboardingComplete, {super.key});
  final bool isOnboardingComplete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final appRouter = AppRouter(isOnboardingComplete: isOnboardingComplete);
    return MaterialApp.router(
      title: 'Tic Tac Toe Game',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
