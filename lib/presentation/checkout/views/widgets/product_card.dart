import 'package:flutter/material.dart';
import 'package:flutter_payment/core/models/checkout_item.dart';

import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/card_decoration.dart';
import 'package:flutter_payment/presentation/checkout/views/widgets/quantity_editor_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_icons.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ProductCard extends StatelessWidget {
  final CheckoutItem checkoutItem;
  final void Function()? onRemove;
  final void Function()? onIncrement;
  final void Function()? onDecrement;
  const ProductCard(
      {super.key,
      required this.checkoutItem,
      this.onRemove,
      this.onIncrement,
      this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
          decoration: cardDecoration(),
          child: Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 80.h,
                child: Image.asset(
                  checkoutItem.product.image!,
                  fit: BoxFit.cover,
                ),
              ),
              20.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    checkoutItem.product.name!,
                    style: context.appTextTheme.bodySmall!
                        .copyWith(color: context.appTheme.primaryColor),
                  ),
                  10.vSpace,
                  Text("\$${checkoutItem.product.price}",
                      style: context.appTextTheme.bodySmall!.copyWith(
                        color: context.appTheme.colorScheme.secondary,
                      )),
                  10.vSpace,
                  QuantityEditor(
                    quantity: checkoutItem.quantity,
                    onIncrement: onIncrement!,
                    onDecrement: onDecrement!,
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 15.w,
          bottom: 20.h,
          child: GestureDetector(
              onTap: onRemove,
              child: const CustomSvgIcon(
                assetPath: Assets.assetsIconsDelete,
              )),
        ),
      ],
    );
  }
}
