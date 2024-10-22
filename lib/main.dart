import 'package:flutter/material.dart';
import 'package:flutter_payment/flutter_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FlutterPaymentApp());
}
