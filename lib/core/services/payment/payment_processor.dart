abstract class PaymentProcessor {
  Future<void> processPayment(
      {required double amount, required String currency});
}
