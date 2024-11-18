import 'package:flutter/material.dart';

class AddPaymentViewmodel extends ChangeNotifier {
  int _selectedPaymentMethodIndex = -1;
  int get selectedPaymentMethodIndex => _selectedPaymentMethodIndex;

  void setSelectedPaymentMethodIndex(int index) {
    _selectedPaymentMethodIndex = index;
    notifyListeners();
  }
}
