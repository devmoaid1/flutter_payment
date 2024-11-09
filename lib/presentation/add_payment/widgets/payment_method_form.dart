import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'text_field_section.dart';

class PaymentMethodForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const PaymentMethodForm({
    super.key,
    required this.formKey,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        FormBuilder(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 120.h,
                      ),
                      child: TextFieldSection(
                        title: 'Cardholder Name',
                        name: 'name',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]')),
                        ],
                        keyboardInputType: TextInputType.name,
                        onChanged: (p0) =>
                            formKey.currentState!.fields['name']?.validate(),
                        hintText: "Moaid Mohamed",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Name is required'),
                          FormBuilderValidators.match(RegExp(r'^[a-zA-Z]+$'),
                              errorText:
                                  'Name can`t contain numbers or special characters'),
                        ]),
                      ),
                    ),
                    10.h.vSpace,
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 120.h,
                      ),
                      child: TextFieldSection(
                        title: 'Card Number',
                        name: 'cardNumber',
                        keyboardInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16)
                        ],
                        hintText: '**** **** **** 1234',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Card number is required',
                          ),
                          FormBuilderValidators.maxLength(16,
                              errorText: 'card number must be 16 digits'),
                          FormBuilderValidators.creditCard(
                              errorText: 'Invalid card number'),
                        ]),
                      ),
                    ),
                    10.h.vSpace,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 140.h),
                              child: TextFieldSection(
                                title: 'Expiry',
                                name: 'expiry',
                                keyboardInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3)
                                ],
                                hintText: "MM/YY",
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Expiry is required',
                                  ),
                                  FormBuilderValidators
                                      .creditCardExpirationDate(
                                          errorText: 'Invalid expiry date'),
                                ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Expanded(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 140.h),
                              child: TextFieldSection(
                                title: 'Security code',
                                keyboardInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3)
                                ],
                                name: 'cvv',
                                hintText: "CVV",
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Security code is required',
                                  ),
                                  FormBuilderValidators.creditCardCVC(
                                      errorText: 'Invalid security code'),
                                  FormBuilderValidators.maxLength(3),
                                ]),
                              ),
                            ),
                          ),
                        ]),
                  ]),
            )),
      ],
    );
  }
}
