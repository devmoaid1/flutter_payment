import 'payment_processor.dart';

class PaypalProcessor implements PaymentProcessor {
  @override
  Future<void> processPayment(
      {required double amount, required String currency}) async {}
}
