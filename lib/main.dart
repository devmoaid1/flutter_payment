import 'package:flutter/material.dart';
import 'package:flutter_payment/core/dependecies.dart';
import 'package:flutter_payment/core/models/payment_method.dart';
import 'package:flutter_payment/core/utils/helpers/payment_methods_enum.dart';
import 'package:flutter_payment/flutter_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupDependecies();
  await Hive.initFlutter();
  Hive.registerAdapter<PaymentMethods>(PaymentMethodsAdapter());
  Hive.registerAdapter<PaymentMethodEntity>(PaymentMethodEntityAdapter());
  runApp(const FlutterPaymentApp());
}
