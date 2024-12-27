// Theme mode enum
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/di/app_providers.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider(this.pref) : super(ThemeMode.light) {
    getCurrentTheme();
  }
  final SharedPreferences pref;
  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    pref.setString(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentTheme() async {
    final theme = pref.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? ThemeMode.system.name}');
    state = value;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  final pref = ref.watch(sharedPreferencesProvider);
  return ThemeProvider(pref);
});
