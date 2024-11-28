import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/errors/exceptions.dart';
import 'package:flutter_payment/core/errors/failures.dart';
import 'package:flutter_payment/core/services/payment/payment_director.dart';

import '../../core/models/payment_request.dart';
import '../../core/utils/helpers/payment_providers.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, void>> makePayment(
      {required PaymentRequest request, required PaymentProviders paymentType});
}

class CheckoutRepositoryImpl implements CheckoutRepository {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentRequest request,
      required PaymentProviders paymentType}) async {
    try {
      // get appropriate payment processor based on payment type
      final paymentProcessor = PaymentDirector.getPaymentProcessor(paymentType);
      // process payment request
      final response = await paymentProcessor.processPayment(request: request);
      return right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on Exception catch (_) {
      return const Left(ServerFailure(message: 'Failed to make payment'));
    }
  }
}
