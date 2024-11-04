import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';

final Map<PaymentMethods, String> paymentMethodToAsset = {
  PaymentMethods.visa: Assets.assetsIconsVisa,
  PaymentMethods.mastercard: Assets.assetsIconsMastercard,
  PaymentMethods.paypal: Assets.assetsIconsPaypal
};
