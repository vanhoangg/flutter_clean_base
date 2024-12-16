import 'dart:async';

import 'package:data/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';
import 'package:shared/shared.dart';

import '../../app/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  Future<void> _goNext() async {
    // Debug
    if (kDebugMode) {
      await Navigator.pushReplacementNamed(context, Routes.mainRoute);
      return;
    }

    // Release
    final bool isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    if (isUserLoggedIn) {
      // navigate to main screen
      await Navigator.pushReplacementNamed(context, Routes.mainRoute);
      return;
    }

    if (await _appPreferences.isOnBoardingScreenViewed()) {
      await Navigator.pushReplacementNamed(context, Routes.loginRoute);
      return;
    }
    await Navigator.pushReplacementNamed(context, Routes.loginRoute);
    // Push onboard
    // Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
