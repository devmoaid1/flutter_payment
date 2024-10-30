import 'package:flutter/material.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CheckoutView.routeName:
    default:
      return MaterialPageRoute(builder: (context) => const CheckoutView());

    // Add more cases for other routes here...
  }
}
