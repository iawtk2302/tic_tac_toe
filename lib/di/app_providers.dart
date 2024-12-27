import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final firebaseAuthProvider = Provider((_) => FirebaseAuth.instance);

final userProvider = Provider((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final user = auth.currentUser!;
  return user;
});
