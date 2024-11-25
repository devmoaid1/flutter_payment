import 'package:flutter_payment/core/local_storage/hive_consumer.dart';
import 'package:flutter_payment/core/local_storage/local_storage_service.dart';
import 'package:flutter_payment/core/utils/helpers/faliure_builder.dart';
import 'package:flutter_payment/presentation/add_payment/viewmodels/add_payment_viewmodel.dart';
import 'package:flutter_payment/presentation/checkout/views/checkout_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../data/repos/payment_method_repository.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  getIt.registerLazySingleton<FaliureBuilder>(
    () => FaliureBuilder(),
  );
  getIt.registerLazySingleton<LocalStorageService>(
    () => HiveConsumer(),
  );
  getIt.registerLazySingleton<PaymentMethodRepository>(
    () => PaymentMethodRepositoryImpl(
        faliureBuilder: getIt(), localStorageService: getIt()),
  );
  getIt.registerFactory<CheckoutViewModel>(
    () => CheckoutViewModel(),
  );
  getIt.registerFactory<AddPaymentViewmodel>(
    () => AddPaymentViewmodel(paymentMethodRepository: getIt()),
  );
}
