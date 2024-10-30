import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/core/models/checkout_item.dart';

import 'models/product.dart';

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
