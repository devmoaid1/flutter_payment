import 'package:flutter_payment/core/models/payment_request.dart';

import 'payment_processor.dart';

class PaypalProcessor implements PaymentProcessor {
  @override
  Future<void> processPayment({required PaymentRequest request}) {
    // TODO: implement processPayment
    throw UnimplementedError();
  }
}
