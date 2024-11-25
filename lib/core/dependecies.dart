import 'package:flutter_payment/presentation/add_payment/viewmodels/add_payment_viewmodel.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerFactory<CheckoutViewModel>(
    () => CheckoutViewModel(),
  );
  getIt.registerFactory<AddPaymentViewmodel>(
    () => AddPaymentViewmodel(),
  );
}
