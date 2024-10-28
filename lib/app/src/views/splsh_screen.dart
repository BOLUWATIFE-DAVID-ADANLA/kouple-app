import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kouple_app/app/routes/app_routes_constants.dart';
import 'package:kouple_app/app/util/svg_assets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // ignore: use_build_context_synchronously
      context.pushNamed(AppRoutesConstants.checker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgAssets(
            svg: 'assets/icons/Kouple.black.svg',
            height: 50,
          ))
        ],
      ),
    );
  }
}
