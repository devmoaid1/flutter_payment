import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/errors/exceptions.dart';
import 'package:flutter_payment/core/errors/failures.dart';
import 'package:flutter_payment/core/services/payment/payment_director.dart';

import '../../core/models/payment_request.dart';
import '../../core/utils/helpers/payment_methods_enum.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, void>> makePayment(
      {required PaymentRequest request, required PaymentMethods paymentMethod});
}

class CheckoutRepositoryImpl implements CheckoutRepository {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentRequest request,
      required PaymentMethods paymentMethod}) async {
    try {
      // get appropriate payment processor based on payment type
      final paymentProcessor =
          PaymentDirector.getPaymentProcessor(paymentMethod);
      // process payment request
      final response = await paymentProcessor.processPayment(request: request);
      return right(response);
    } on PaymentProcessorException catch (e) {
      return Left(PaymentProcessorFailure(message: e.message));
    }
  }
}
