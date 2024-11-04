import 'package:flutter/material.dart';

import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/presentation/checkout/views/widgets/checkout_total_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/heading_widget.dart';
import '../checkout_viewmodel.dart';
import 'empty_state.dart';
import 'products_list_section.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        if (Provider.of<CheckoutViewModel>(context, listen: true)
            .checkoutItems
            .isEmpty) {
          return const EmptyState();
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.vSpace,
                  const HeadingWidget(
                    title: 'Checkout',
                  ),
                  42.vSpace,
                  const ProductsListSection(),
                  20.vSpace,
                  const CheckoutTotalSection()
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
