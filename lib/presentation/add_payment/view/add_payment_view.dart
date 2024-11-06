import 'package:flutter/material.dart';
import 'package:flutter_payment/presentation/add_payment/widgets/add_payment_view_body.dart';

class AddPaymentView extends StatelessWidget {
  const AddPaymentView({super.key});

  static const routeName = '/AddPaymentViewRoute';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: AddPaymentViewBody(),
      ),
    );
  }
}
