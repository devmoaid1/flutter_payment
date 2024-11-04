import 'package:flutter/material.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';

import '../../presentation/splash/views/splash_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());
    case SplashView.routeName:
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());

    // Add more cases for other routes here...
  }
}
