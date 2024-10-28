import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/controllers/auth_controller.dart';
import 'package:kouple_app/app/repo/authentication_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = Provider((ref) {
  return SupabaseRepo(client: Supabase.instance.client);
});

class SupabaseRepo implements AuthenticationRepo {
  final SupabaseClient client;
  SupabaseRepo({required this.client});
  @override
  Future<AuthResponse> signIn(
      {required String email, required String password}) async {
    try {
      final result = await client.auth
          .signInWithPassword(password: password, email: email);

      return result;
    } catch (e) {
      if (e.toString().contains('400')) {
        throw AuthenticationException(
            'invalid credentials, your email or password is invalid');
      } else {
        throw AuthenticationException(
            'something went wrong...oops try agian please');
      }
    }
  }

  @override
  Future signOut() async {
    try {
      final result = await client.auth.signOut();
      return result;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? username,
  }) async {
    try {
      final result = await client.auth.signUp(
          password: password, email: email, data: {'username': username});
      return result;
    } catch (e) {
      if (e.toString().contains('user_already_exists')) {
        throw AuthenticationException(
            'Sorry this password and username has been taken...');
      } else {
        debugPrint('error here');
        throw AuthenticationException('user not created');
      }
    }
  }

  Stream<AuthState> get authstatechange => client.auth.onAuthStateChange;
}
