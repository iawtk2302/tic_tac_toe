import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/core/services/auth_service.dart';
import 'package:tic_tac_toe/di/app_providers.dart';
import 'package:tic_tac_toe/features/auth/presentation/notifiers/auth_state_notifier.dart';
import 'package:tic_tac_toe/features/auth/presentation/state/auth_state.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final authService = AuthService();
  final pref = ref.watch(sharedPreferencesProvider);
  return AuthStateNotifier(authService, firebaseAuth, pref);
});
