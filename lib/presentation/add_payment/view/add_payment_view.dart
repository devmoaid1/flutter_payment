import 'package:flutter/material.dart';
import 'package:flutter_payment/presentation/add_payment/viewmodels/add_payment_viewmodel.dart';
import 'package:flutter_payment/presentation/add_payment/widgets/add_payment_view_body.dart';
import 'package:provider/provider.dart';

import '../../../core/dependecies.dart';

class AddPaymentView extends StatelessWidget {
  const AddPaymentView({super.key});

  static const routeName = '/AddPaymentViewRoute';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: ChangeNotifierProvider<AddPaymentViewmodel>(
            create: (context) => getIt<AddPaymentViewmodel>(),
            lazy: false,
            child: const AddPaymentViewBody()),
      ),
    );
  }
}
