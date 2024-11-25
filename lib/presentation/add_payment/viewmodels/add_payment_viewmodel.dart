import 'package:flutter/material.dart';
import 'package:flutter_payment/data/repos/payment_method_repository.dart';

import '../../../core/models/payment_method.dart';

class AddPaymentViewmodel extends ChangeNotifier {
  int _selectedPaymentMethodIndex = -1;
  int get selectedPaymentMethodIndex => _selectedPaymentMethodIndex;

  String _errorMessage = '';
  String get errorMessageString => _errorMessage;
  final PaymentMethodRepository _paymentMethodRepository;

  AddPaymentViewmodel(
      {required PaymentMethodRepository paymentMethodRepository})
      : _paymentMethodRepository = paymentMethodRepository;

  void setSelectedPaymentMethodIndex(int index) {
    _selectedPaymentMethodIndex = index;
    notifyListeners();
  }

  Future<bool> addPaymentMethod(PaymentMethodEntity paymentMethod) async {
    final response =
        await _paymentMethodRepository.addPaymentMethod(paymentMethod);
    return response.fold((failure) {
      _errorMessage = failure.message;
      notifyListeners();
      return false;
    }, (_) {
      _errorMessage = '';
      notifyListeners();
      return true;
    });
  }
}
