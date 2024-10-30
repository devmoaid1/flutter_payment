import 'package:flutter/material.dart';
import 'package:flutter_payment/core/routes/routing.dart';
import 'package:flutter_payment/core/theme/light_theme.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterPaymentApp extends StatelessWidget {
  const FlutterPaymentApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: onGenerateRoute,
        navigatorObservers: [RouteObserver()],
        initialRoute: CheckoutView.routeName,
        debugShowCheckedModeBanner: false,
        title: 'Payment',
        theme: lightTheme,
        home: const CheckoutView(),
      ),
    );
  }
}
