import 'package:equatable/equatable.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';
import 'package:hive/hive.dart';

part 'payment_method.g.dart';

@HiveType(typeId: 0)
class PaymentMethodEntity extends Equatable {
  @HiveField(0)
  final PaymentMethods? paymentMethod;
  @HiveField(1)
  final String? cardHolderName;
  @HiveField(2)
  final String? cardNumber;
  @HiveField(3)
  final String? expiryDate;
  @HiveField(4)
  final String? cvv;

  const PaymentMethodEntity(
      {this.paymentMethod,
      this.cardHolderName,
      this.cardNumber,
      this.expiryDate,
      this.cvv});

  @override
  List<Object?> get props =>
      [paymentMethod, cardHolderName, cardNumber, expiryDate, cvv];
}
