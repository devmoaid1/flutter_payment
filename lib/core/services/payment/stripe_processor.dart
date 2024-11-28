import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_payment/core/networking/base_api.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../models/payment_intnet_response.dart';
import '../../models/payment_request.dart';
import 'payment_processor.dart';

class StripeProcessor extends PaymentProcessor {
  final BaseApi _baseApi;

  // Private constructor
  StripeProcessor._internal({required BaseApi baseApi}) : _baseApi = baseApi;

  // Singleton instance
  static StripeProcessor? _instance;

  // Factory constructor for external access
  factory StripeProcessor({required BaseApi baseApi}) {
    return _instance ??= StripeProcessor._internal(baseApi: baseApi);
  }

  Future<String> getClientSecretKey({required PaymentRequest request}) async {
    final headers = _preparePaymentIntentOptions();
    final paymentIntent = await _baseApi.post<PaymentIntnetResponse>(
      url: 'payment_intents',
      body: request.toJson(),
      fromJson: PaymentIntnetResponse.fromJson,
      data: Options(headers: headers),
    );

    return paymentIntent.clientSecret;
  }

  Map<String, dynamic> _preparePaymentIntentOptions() {
    final secretKey = dotenv.env['STRIPE_SECRET_KEY'];
    return {
      'Authorization': 'Bearer $secretKey',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
  }

  Future<void> _initializePaymentSheet({required String clientSecret}) async {
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Moaid Mohamed',
      ),
    );
  }

  @override
  Future<void> processPayment({required PaymentRequest request}) async {
    final clientSecret = await getClientSecretKey(request: request);

    await _initializePaymentSheet(clientSecret: clientSecret);

    await Stripe.instance.presentPaymentSheet();
  }
}
