import 'package:flutter_payment/presentation/checkout/views/checkout_viewmodel.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerFactory<CheckoutViewModel>(
    () => CheckoutViewModel(),
  );
}
