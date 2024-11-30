import 'package:flutter_payment/core/app_icons.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';

final Map<PaymentMethods, String> paymentMethodToAsset = {
  PaymentMethods.creditCard: Assets.assetsIconsCreditCardIcon,
  PaymentMethods.paypal: Assets.assetsIconsPaypal
};
