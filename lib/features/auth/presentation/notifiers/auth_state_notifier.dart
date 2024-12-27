import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/core/services/auth_service.dart';
import 'package:tic_tac_toe/features/auth/presentation/state/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final FirebaseAuth _auth;
  final SharedPreferences _pref;
  AuthStateNotifier(this._authService, this._auth, this._pref)
      : super(const AuthState.loading()) {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        state = const AuthState.unauthenticated();
      } else {
        state = const AuthState.authenticated();
      }
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      state = const AuthState.loading();
      final userCredential = await _authService.signInWithGoogle();
      final user = userCredential.user;
      final isOnboardingComplete = _pref.getBool(ONBOARDING_COMPLETE) ?? false;
      if (user != null) {
        if (!isOnboardingComplete) {
          _pref.setBool(ONBOARDING_COMPLETE, true);
        }
        state = const AuthState.authenticated();
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    state = const AuthState.unauthenticated();
  }
}
