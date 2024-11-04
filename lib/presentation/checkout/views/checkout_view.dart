import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/presentation/add_payment/view/add_payment_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/dependecies.dart';
import 'checkout_viewmodel.dart';
import 'widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = '/checkout';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckoutViewModel>(
      create: (_) => getIt<CheckoutViewModel>(),
      child: Scaffold(
        body: const CheckoutViewBody(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPaymentView.routeName);
            },
            text: 'Checkout',
          ),
        ),
      ),
    );
  }
}
