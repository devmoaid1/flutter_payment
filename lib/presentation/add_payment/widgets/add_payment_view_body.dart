import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

import 'package:flutter_payment/core/widgets/heading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'payment_method_form.dart';
import 'payments_methods_section.dart';

final _formKey = GlobalKey<FormBuilderState>();

class AddPaymentViewBody extends StatelessWidget {
  const AddPaymentViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: 16.h.vSpace),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const HeadingWidget(title: 'Add Payment Method'),
            ),
          ),
          SliverToBoxAdapter(child: 30.h.vSpace),
          const SliverToBoxAdapter(child: PaymentMethodsSection()),
          SliverToBoxAdapter(child: 60.h.vSpace),
          SliverToBoxAdapter(
              child: PaymentMethodForm(
            formKey: _formKey,
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      text: 'Add Payment Method'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
