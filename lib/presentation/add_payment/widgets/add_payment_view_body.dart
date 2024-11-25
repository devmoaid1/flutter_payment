import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_payment/core/utils/extensions/spaces.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';

import 'package:flutter_payment/core/widgets/heading_widget.dart';
import 'package:flutter_payment/presentation/add_payment/viewmodels/add_payment_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../core/models/payment_method.dart';
import '../../../core/utils/helpers/payment_methods_enum.dart';
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
                    onPressed: () async {
                      final viewModel = Provider.of<AddPaymentViewmodel>(
                          context,
                          listen: false);
                      // Validate the form
                      if (_formKey.currentState!.validate()) {
                        // Save the form values
                        _formKey.currentState!.save();

                        // Fetch values using the keys
                        final formData = _formKey.currentState!.value;
                        final cardHolderName = formData['name']?.trim() ?? '';
                        final cardNumber = formData['cardNumber']?.trim() ?? '';
                        final cvv = formData['cvv']?.trim() ?? '';
                        final expiry = formData['expiry']?.trim() ?? '';

                        // Create a payment method entity
                        final paymentMethod = PaymentMethodEntity(
                          paymentMethod:
                              PaymentMethods.mastercard, // Example enum
                          cardHolderName: cardHolderName,
                          cardNumber: cardNumber,
                          expiryDate: expiry,
                          cvv: cvv,
                        );

                        // Use the ViewModel to add the payment method
                        final success =
                            await viewModel.addPaymentMethod(paymentMethod);

                        // Show appropriate toast based on the result
                        if (success) {
                          Fluttertoast.showToast(
                            msg: 'Payment method added successfully!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: viewModel.errorMessageString,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      }
                    },
                    text: 'Add Payment Method'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
