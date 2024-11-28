import 'payment_processor.dart';

class StripeProcessor extends PaymentProcessor {
  @override
  Future<void> processPayment(
      {required double amount, required String currency}) async {}
}
