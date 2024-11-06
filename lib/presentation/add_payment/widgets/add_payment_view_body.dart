import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';

import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/core/widgets/custom_text_field.dart';

import 'package:flutter_payment/core/widgets/heading_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'payments_methods_section.dart';
import 'text_field_section.dart';

class AddPaymentViewBody extends StatelessWidget {
  const AddPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
            60.h.vSpace,
            PaymentMethodForm()
          ],
        ),
      ),
    );
  }
}

class PaymentMethodForm extends StatelessWidget {
  PaymentMethodForm({
    super.key,
  });
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextFieldSection(
              title: 'Cardholder Name',
              name: 'name',
              hintText: "Moaid Mohamed",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.match(RegExp(r'^[a-zA-Z]+$'),
                    errorText:
                        'Name can`t contain numbers or special characters'),
              ]),
            ),
            35.h.vSpace,
            TextFieldSection(
              title: 'Card Number',
              name: 'cardNumber',
              hintText: '**** **** **** 1234',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.creditCard(
                    errorText: 'Invalid card number'),
              ]),
            ),
            35.h.vSpace,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: TextFieldSection(
                  title: 'Expiry',
                  name: 'expiry',
                  hintText: "MM/YY",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.creditCardExpirationDate(
                        errorText: 'Invalid expiry date'),
                  ]),
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              Expanded(
                child: TextFieldSection(
                  title: 'Security code',
                  name: 'cvv',
                  hintText: "CVV",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.creditCardCVC(
                        errorText: 'Invalid security code'),
                  ]),
                ),
              ),
            ]),
            CustomButton(onPressed: () {}, text: 'Add Card'),
          ]),
        ));
  }
}
