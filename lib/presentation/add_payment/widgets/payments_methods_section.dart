import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';
import 'package:flutter_payment/presentation/add_payment/viewmodels/add_payment_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/helpers/payment_method_to_asset.dart';
import '../../../core/widgets/custom_svg_icon.dart';

class PaymentMethodsSection extends StatelessWidget {
  const PaymentMethodsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.h,
        child: Selector<AddPaymentViewmodel, int>(
            selector: (ctx, viewModel) => viewModel.selectedPaymentMethodIndex,
            shouldRebuild: (previous, next) => previous != next,
            builder: (context, selectedIndex, child) {
              return PaymentMethodsList(
                selectedIndex: selectedIndex,
                onTap: (index) => context
                    .read<AddPaymentViewmodel>()
                    .setSelectedPaymentMethodIndex(selectedIndex),
              );
            }));
  }
}

class PaymentMethodsList extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index)? onTap;

  const PaymentMethodsList({
    super.key,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 16.w),
        itemCount: PaymentMethods.values.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap == null ? null : () => onTap!(index),
            child: PaymentMethodCard(
              key:
                  ValueKey(paymentMethodToAsset[PaymentMethods.values[index]]!),
              iconPath: paymentMethodToAsset[PaymentMethods.values[index]]!,
              isSelected: index == selectedIndex,
            ),
          );
        });
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  const PaymentMethodCard({
    super.key,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isSelected
              ? context.appTheme.primaryColor
              : context.appTheme.colorScheme.shadow,
          width: isSelected ? 1.7 : 1.3,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      child: Center(
        child: CustomSvgIcon(
          assetPath: iconPath,
        ),
      ),
    );
  }
}
