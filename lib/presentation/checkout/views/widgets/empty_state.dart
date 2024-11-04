import 'package:flutter/material.dart';
import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_svg_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const CustomSvgIcon(assetPath: Assets.assetsIconsEmptyCart),
          25.w.vSpace,
          Text(
            'Empty Cart, add products to checkout',
            style: context.appTextTheme.bodySmall!
                .copyWith(color: context.appTheme.colorScheme.outline),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
