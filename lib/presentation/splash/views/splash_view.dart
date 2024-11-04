import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';

import '../widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primaryColor,
      body: const SplashBody(),
    );
  }
}
