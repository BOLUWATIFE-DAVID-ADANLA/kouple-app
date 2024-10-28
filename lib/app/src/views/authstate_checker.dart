import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/providers/auth_providers.dart';
import 'package:kouple_app/app/src/views/home_screen.dart';
import 'package:kouple_app/app/src/views/login_screen.dart';
import 'package:kouple_app/app/src/views/splsh_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthstateChecker extends ConsumerWidget {
  const AuthstateChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authcheckvlaue = ref.watch(authStateChangeProvider);
    return authcheckvlaue.when(
      data: (data) {
        final event = data.event;

        switch (event) {
          // case AuthChangeEvent.initialSession:
          //   // handle initial session
          //   return const LoginScreen();
          case AuthChangeEvent.signedIn:
            // handle signed in
            return const HomeScreen();
          case AuthChangeEvent.signedOut:
            // handle signed out
            return const LoginScreen();

          default:
            return const LoginScreen();
        }
      },
      loading: () => const SplashScreenView(),
      error: (error, stackTrace) => const LoginScreen(),
    );
  }
}
