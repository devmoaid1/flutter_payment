import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/core/widgets/heading_widget.dart';
import 'package:flutter_payment/presentation/add_payment/widgets/payments_methods_section.dart';

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
      builder: (context, child) => Scaffold(
        body: const CheckoutViewBody(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: CustomButton(
            onPressed: () => _showPaymentMethodBottomSheet(context),
            text: 'Checkout',
          ),
        ),
      ),
    );
  }

  void _showPaymentMethodBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline
              const HeadingWidget(title: 'Select Payment Method'),
              20.h.vSpace,

              // Horizontal List of Payment Methods
              SizedBox(
                  height: 100.h,
                  child: PaymentMethodsList(onTap: () => {}, selectedIndex: 1)),
            ],
          ),
        );
      },
    );
  }
}
