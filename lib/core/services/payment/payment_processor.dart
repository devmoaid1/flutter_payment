import '../../models/payment_request.dart';

abstract class PaymentProcessor {
  Future<void> processPayment({
    required PaymentRequest request,
  });
}
