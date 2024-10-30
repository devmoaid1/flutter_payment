import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/card_decoration.dart';
import '../checkout_viewmodel.dart';

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

            Selector<CheckoutViewModel, double>(
              selector: (ctx, viewModel) => viewModel.subTotal,
              builder: (context, value, child) => TotalRow(
                  title: 'SubTotal', value: value, isTotalPrice: false),
            ),
            10.h.vSpace,
            // Taxes Row
            Selector<CheckoutViewModel, double>(
              selector: (ctx, viewModel) => viewModel.taxes,
              builder: (context, value, child) =>
                  TotalRow(title: 'Taxes', value: value, isTotalPrice: false),
            ),

            10.h.vSpace,
            Selector<CheckoutViewModel, double>(
              selector: (ctx, viewModel) => viewModel.shipping,
              builder: (context, value, child) => TotalRow(
                  title: 'Shipping', value: value, isTotalPrice: false),
            ),

            10.h.vSpace,
            // Total Row
            Selector<CheckoutViewModel, double>(
              selector: (ctx, viewModel) => viewModel.total,
              builder: (context, value, child) =>
                  TotalRow(title: 'Total:', value: value, isTotalPrice: true),
            ),
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
