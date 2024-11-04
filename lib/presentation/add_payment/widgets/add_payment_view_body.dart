import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_svg_icon.dart';
import 'package:flutter_payment/core/widgets/heading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_icons.dart';
import 'payments_methods_section.dart';

class AddPaymentViewBody extends StatelessWidget {
  const AddPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.h.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const HeadingWidget(title: 'Add Payment Method'),
          ),
          30.h.vSpace,
          const PaymentMethodsSection(),
          60.h.vSpace
        ],
      ),
    );
  }
}
