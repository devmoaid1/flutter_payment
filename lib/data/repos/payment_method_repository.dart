import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/constants.dart';
import 'package:flutter_payment/core/models/payment_method.dart';
import 'package:flutter_payment/core/utils/helpers/faliure_builder.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/local_storage/local_storage_service.dart';

abstract class PaymentMethodRepository {
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods();
  Future<Either<Failure, void>> addPaymentMethod(
      PaymentMethodEntity paymentMethod);
}

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final LocalStorageService _localStorageService;
  final FaliureBuilder _faliureBuilder;

  PaymentMethodRepositoryImpl(
      {required LocalStorageService localStorageService,
      required FaliureBuilder faliureBuilder})
      : _localStorageService = localStorageService,
        _faliureBuilder = faliureBuilder;

  @override
  Future<Either<Failure, void>> addPaymentMethod(
      PaymentMethodEntity paymentMethod) async {
    try {
      // add payment method chosen by user to local storage
      final addedPaymentMethod =
          await _localStorageService.addData<PaymentMethodEntity>(
              AppConstants.paymentMethodsBoxKey, paymentMethod);
      return Right(addedPaymentMethod);
    } on CacheException catch (exc) {
      return Left(_faliureBuilder.build(exc));
    }
  }

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> getPaymentMethods() async {
    try {
      // get payment methods saved by user from local storage
      final paymentMethods = await _localStorageService
          .getDataList<PaymentMethodEntity>(AppConstants.paymentMethodsBoxKey);

      return Right(paymentMethods);
    } on CacheException catch (exc) {
      return Left(_faliureBuilder.build(exc));
    }
  }
}
