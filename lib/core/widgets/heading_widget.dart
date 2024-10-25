import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/extensions/app_context.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  const HeadingWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.appTextTheme.headlineMedium,
    );
  }
}
