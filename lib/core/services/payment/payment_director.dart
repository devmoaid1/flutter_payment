import 'package:flutter_payment/core/dependecies.dart';
import 'package:flutter_payment/core/networking/base_api.dart';
import 'package:flutter_payment/core/services/payment/payment_processor.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';

import 'paypal_processor.dart';
import 'stripe_processor.dart';

class PaymentDirector {
  static PaymentProcessor getPaymentProcessor(PaymentMethods paymentMethods) {
    switch (paymentMethods) {
      case PaymentMethods.paypal:
        return PaypalProcessor();
      case PaymentMethods.creditCard:
      default:
        return StripeProcessor(baseApi: getIt<BaseApi>());
    }
  }
}
