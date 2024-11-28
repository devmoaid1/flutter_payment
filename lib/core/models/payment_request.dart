import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final String amount;
  final String currency;

  const PaymentRequest({required this.amount, required this.currency});
  @override
  List<Object?> get props => [amount, currency];
  Map<String, dynamic> toJson() => {'amount': amount, 'currency': currency};
}
