import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/card_decoration.dart';

class CheckoutTotalSection extends StatelessWidget {
  const CheckoutTotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(15), // Padding inside the container
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Align to fill the width
          children: [
            // SubTotal Row

            const TotalRow(
                title: 'SubTotal', value: 110.00, isTotalPrice: false),
            10.h.vSpace,
            // Taxes Row

            const TotalRow(title: 'Taxes', value: 0.00, isTotalPrice: false),
            10.h.vSpace,

            const TotalRow(
                title: 'Shipping', value: 10.00, isTotalPrice: false),
            10.h.vSpace,
            // Total Row
            const TotalRow(title: 'Total:', value: 120.00, isTotalPrice: true)
          ],
        ),
      ),
    );
  }
}

class TotalRow extends StatelessWidget {
  final String title;
  final double value;
  final bool isTotalPrice;
  const TotalRow(
      {super.key,
      required this.title,
      required this.value,
      required this.isTotalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: isTotalPrice
              ? context.appTextTheme.headlineMedium
              : context.appTextTheme.bodySmall!.copyWith(
                  color: context.appTheme.colorScheme.outline,
                ),
        ),
        Text(
          '\$$value', // Replace with the actual total value
          style: isTotalPrice
              ? context.appTextTheme.headlineMedium
              : context.appTextTheme.bodySmall,
        ),
      ],
    );
  }
}
