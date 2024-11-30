mixin SelectPaymentMixin {
  int _selectedPaymentMethod = 0;
  int get selectedPaymentMethod => _selectedPaymentMethod;
  void selectPaymentMethod(int index) {
    _selectedPaymentMethod = index;
  }
}
