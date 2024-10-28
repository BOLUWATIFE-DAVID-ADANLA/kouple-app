import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/controllers/auth_controller.dart';
import 'package:kouple_app/app/models/auth_state.dart';
import 'package:kouple_app/app/repo/supabase_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthenticationState>((ref) {
  return AuthController(ref);
});

final authStateChangeProvider = StreamProvider<AuthState>((ref) {
  return ref.read(authProvider).authstatechange;
});
