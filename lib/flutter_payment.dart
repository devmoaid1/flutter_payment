import 'package:flutter/material.dart';
import 'package:flutter_payment/core/theme/light_theme.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';

class FlutterPaymentApp extends StatelessWidget {
  const FlutterPaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment',
      theme: lightTheme,
      home: const CheckoutView(),
    );
  }
}
