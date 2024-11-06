import 'package:flutter/material.dart';
import 'package:flutter_payment/core/constants.dart';
import 'package:flutter_payment/core/models/checkout_item.dart';

class CheckoutViewModel extends ChangeNotifier {
  List<CheckoutItem> _checkoutItems = [];
  List<CheckoutItem> get checkoutItems => _checkoutItems;

  double _subTotal = 0.0;
  double _taxes = 0.0;
  double _shipping = 0.0;
  double _total = 0.0;

  double get subTotal => _subTotal;
  double get taxes => _taxes;
  double get shipping => _shipping;
  double get total => _total;

  CheckoutViewModel() {
    _checkoutItems = checkouts;
    _subTotal = 340.00;
    _shipping = 0.00;
    _taxes = _calculateTaxes();
    _total = _calculateTotal();
  }

  double _calculateTaxes() {
    return _subTotal * 0.10;
  }

  double _calculateTotal() {
    return _subTotal + _shipping + _taxes;
  }

  void removeItem(CheckoutItem checkoutItem) {
    _checkoutItems.remove(checkoutItem);
    _subTotal -= checkoutItem.product.price! * checkoutItem.quantity;
    _taxes = _calculateTaxes();
    _total = _calculateTotal();
    notifyListeners();
  }

  void increaseQuantity(CheckoutItem checkoutItem) {
    // get index of the checkout item
    final checkoutIndex = _checkoutItems.indexOf(checkoutItem);
    // update quantity
    final updatedItem =
        checkoutItem.copyWith(quantity: checkoutItem.quantity + 1);
    // update checkout list with new quantity
    _checkoutItems[checkoutIndex] = updatedItem;
    _subTotal += checkoutItem.product.price!;
    // update taxes and total
    _taxes = _calculateTaxes();
    _total = _calculateTotal();
    notifyListeners();
  }

  void decreaseQuantity(CheckoutItem checkoutItem) {
    if (checkoutItem.quantity > 1) {
      // get index of the checkout item
      final checkoutIndex = _checkoutItems.indexOf(checkoutItem);
      // update quantity
      final updatedItem =
          checkoutItem.copyWith(quantity: checkoutItem.quantity - 1);
      // update checkout list with new quantity
      _checkoutItems[checkoutIndex] = updatedItem;
      _subTotal -= checkoutItem.product.price!;
      // update taxes and total
      _taxes = _calculateTaxes();
      _total = _calculateTotal();
    } else {
      removeItem(checkoutItem);
    }
    notifyListeners();
  }
}