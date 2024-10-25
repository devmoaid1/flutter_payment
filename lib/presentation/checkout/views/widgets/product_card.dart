import 'package:flutter/material.dart';

import 'package:flutter_payment/core/models/product.dart';
import 'package:flutter_payment/core/theme/app_colors.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25))
          ]),
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
            ],
          )
        ],
      ),
    );
  }
}
