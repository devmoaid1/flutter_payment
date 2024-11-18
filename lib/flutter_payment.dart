import 'package:flutter/material.dart';
import 'package:flutter_payment/core/routes/routing.dart';
import 'package:flutter_payment/core/theme/light_theme.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_view.dart';
import 'package:flutter_payment/presentation/splash/views/splash_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FlutterPaymentApp extends StatelessWidget {
  const FlutterPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.routeName,
        supportedLocales: FormBuilderLocalizations.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          FormBuilderLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'Payment',
        theme: lightTheme,
        home: const CheckoutView(),
      ),
    );
  }
}
