import 'package:flutter/material.dart';

import 'package:flutter_payment/core/models/product.dart';

import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/card_decoration.dart';
import 'package:flutter_payment/presentation/checkout/views/widgets/quantity_editor_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/app_icons.dart';
import '../../../../core/widgets/custom_svg_icon.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

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
                  product.image!,
                  fit: BoxFit.cover,
                ),
              ),
              20.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: context.appTextTheme.bodySmall!
                        .copyWith(color: context.appTheme.primaryColor),
                  ),
                  10.vSpace,
                  Text("\$${product.price}",
                      style: context.appTextTheme.bodySmall!.copyWith(
                        color: context.appTheme.colorScheme.secondary,
                      )),
                  10.vSpace,
                  QuantityEditor(
                    quantity: 1,
                    onIncrement: () {},
                    onDecrement: () {},
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
              onTap: () {},
              child: const CustomSvgIcon(
                assetPath: Assets.assetsIconsDelete,
              )),
        ),
      ],
    );
  }
}
