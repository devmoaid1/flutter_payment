import 'package:flutter/material.dart';
import 'package:flutter_payment/core/theme/light_theme.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const CheckoutView(),
    );
  }
}
