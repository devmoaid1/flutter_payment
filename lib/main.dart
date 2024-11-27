import 'package:flutter/material.dart';
import 'package:flutter_payment/core/dependecies.dart';
import 'package:flutter_payment/core/models/payment_method.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';
import 'package:flutter_payment/flutter_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupDependecies();
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter<PaymentMethods>(PaymentMethodsAdapter());
  Hive.registerAdapter<PaymentMethodEntity>(PaymentMethodEntityAdapter());
  await Hive.openBox<PaymentMethodEntity>(AppConstants.paymentMethodsBoxKey);
  // Load .env file
  await dotenv.load(fileName: ".env");
  runApp(const FlutterPaymentApp());
}
