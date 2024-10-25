import 'package:flutter/material.dart';
import 'package:flutter_payment/core/theme/app_colors.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityEditor extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityEditor({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Minus Button
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.remove,
                size: 17, color: context.appTheme.colorScheme.secondary),
          ),
        ),

        // Quantity Display
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            '$quantity',
            style: context.appTextTheme.bodySmall,
          ),
        ),

        // Plus Button
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.add,
                size: 17, color: context.appTheme.colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
