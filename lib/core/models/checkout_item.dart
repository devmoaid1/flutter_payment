import 'package:equatable/equatable.dart';
import 'package:flutter_payment/core/models/product.dart';

class CheckoutItem extends Equatable {
  final Product product;
  final int quantity;

  const CheckoutItem({required this.product, required this.quantity});
  CheckoutItem copyWith({Product? product, int? quantity}) {
    return CheckoutItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'CheckoutItem(product: ${product.toString()}, quantity: $quantity)';
  }

  @override
  List<Object?> get props => [product, quantity];
}
