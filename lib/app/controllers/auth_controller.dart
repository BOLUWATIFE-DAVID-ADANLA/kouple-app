import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/models/auth_state.dart';
import 'package:kouple_app/app/repo/supabase_repo.dart';

class AuthController extends StateNotifier<AuthenticationState> {
  final Ref ref;
  AuthController(
    this.ref,
  ) : super(const AuthStateInitial());

  void signin(String email, String password) async {
    state = const AuthstateLoding();
    try {
      await ref.read(authProvider).signIn(email: email, password: password);
      state = const AuthstateSuccess();
    } catch (e) {
      state = AuthstateError(e.toString());
    }
  }

  void signUp(String email, String password, String username) async {
    state = const AuthstateLoding();
    try {
      await ref
          .read(authProvider)
          .signUp(email: email, password: password, username: username);
      state = const AuthstateSuccess();
    } catch (e) {
      state = AuthstateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authProvider).signOut();
    state = const AuthstateSuccess();
  }
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);

  @override
  String toString() {
    return message;
  }
}
