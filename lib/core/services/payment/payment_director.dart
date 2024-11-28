import 'package:flutter_payment/core/dependecies.dart';
import 'package:flutter_payment/core/networking/base_api.dart';
import 'package:flutter_payment/core/services/payment/payment_processor.dart';
import 'package:flutter_payment/core/utils/helpers/payment_providers.dart';

import 'paypal_processor.dart';
import 'stripe_processor.dart';

class PaymentDirector {
  static PaymentProcessor getPaymentProcessor(
      PaymentProviders paymentProviders) {
    switch (paymentProviders) {
      case PaymentProviders.stripe:
        return StripeProcessor(baseApi: getIt<BaseApi>());
      case PaymentProviders.paypal:
        return PaypalProcessor();
    }
  }
}
