import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kouple_app/app/models/pc_model.dart';
import 'package:kouple_app/app/routes/app_routes_constants.dart';
import 'package:kouple_app/app/src/views/authstate_checker.dart';
import 'package:kouple_app/app/src/views/home_screen.dart';
import 'package:kouple_app/app/src/views/itempage.dart';

import 'package:kouple_app/app/src/views/login_screen.dart';
import 'package:kouple_app/app/src/views/register.dart';
import 'package:kouple_app/app/src/views/splsh_screen.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: AppRoutesConstants.login,
        path: '/login',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginScreen()),
      ),
      GoRoute(
        path: '/',
        name: AppRoutesConstants.checker,
        pageBuilder: (context, state) =>
            const MaterialPage(child: AuthstateChecker()),
      ),
      GoRoute(
        name: AppRoutesConstants.register,
        path: '/register',
        pageBuilder: (context, state) =>
            const MaterialPage(child: RegisterScreen()),
      ),
      GoRoute(
        name: AppRoutesConstants.home,
        path: '/home',
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        name: AppRoutesConstants.splash,
        path: '/splash',
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreenView()),
      ),
      GoRoute(
        name: AppRoutesConstants.itemPage,
        path: '/itemPage',
        pageBuilder: (context, state) {
          final pcModel = state.extra as PcModel;
          return MaterialPage(
            child: Itempage(pc: pcModel),
          );
        },
      )
    ],
  );
}
