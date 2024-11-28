import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/core/models/checkout_item.dart';

import 'models/product.dart';

class AppConstants {
  static const String paymentMethodsBoxKey = "paymentMethods";
  static const String baseApiUrl = 'https://api.stripe.com/v1/';
}

List<CheckoutItem> checkouts = [
  const CheckoutItem(
      product: Product(
          image: Assets.assetsIconsProduct, name: "Fancy Sofa", price: 120.00),
      quantity: 1),
  const CheckoutItem(
      product: Product(
          image: Assets.assetsIconsProduct, name: "luxury Sofa", price: 220.00),
      quantity: 1),
];
